//
//  URLSession+Extension.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/21.
//

import Foundation

extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func dataTask(_ endpoint: URLRequest, handler: @escaping Handler) -> URLSessionDataTask {
        let task = dataTask(with: endpoint, completionHandler: handler)
        task.resume()
        return task
    }
    
    static func request<T: Codable>(_ session: URLSession = .shared, endpoint: URLRequest, completion: @escaping (T?, APIError?) -> Void) {
        
        session.dataTask(endpoint) { data, response, error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completion(nil, .failed)
                    return
                }
                
                guard let data = data else {
                    completion(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(nil, .invalidResponse)
                    return
                }
                
                
                guard response.statusCode == KakaoStatusCode.ok.rawValue else {
                    do {
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode(ErrorBody.self, from: data)
                    } catch {
                        return
                    }
                    completion(nil, .failed)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userData = try decoder.decode(T.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .invalidData)
                }
            }
        }
    }
    
    static func requestResultType<T: Codable>(_ session: URLSession = .shared, endpoint: URLRequest, completion: @escaping (Result<T, KaokaoAPISearchError>) -> ()) {
        
        session.dataTask(endpoint) { data, response, error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    print("erro 발생")
                    return
                }
                
                guard let data = data else {
                    print("no Data")
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    print("invalidResponse")
                    return
                }
                
                
                guard response.statusCode == KakaoStatusCode.ok.rawValue else {
                    completion(.failure(KaokaoAPISearchError(rawValue: response.statusCode) ?? .unknown))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(T.self, from: data)
                    completion(.success(data))
                } catch {
                    completion(.failure((.invalidData)))
                }
            }
        }.resume()
    }

}
