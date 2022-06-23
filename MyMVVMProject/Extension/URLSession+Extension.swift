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
    
    static func requestResultType<T: Codable>(_ session: URLSession = .shared, endpoint: URLRequest, completion: @escaping (Result<T, KaokaoAPISearchError>) -> ()) {
        
        session.dataTask(endpoint) { data, response, error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completion(.failure((.failed)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure((.noData)))
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure((.invalidResponse)))
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
