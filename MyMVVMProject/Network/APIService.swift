//
//  APIService.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/21.
//

import Foundation

class APIService {

    private init() { }
    
    static func searchImage(query: String, page: Int, size: Int = 30, completion: @escaping (Result<KaKaoImageResponse, KaokaoAPISearchError>) -> Void) {
        //URLComponents -> 스트럭트 타입이라서 let으로 선언하면 QueryItem을 수정할 수 없다.
//        guard var component = URLComponents(string: Endpoint.search.urlString) else { return }
//        component.queryItems = [
//            URLQueryItem(name: "query", value: "\(query)"),
//            URLQueryItem(name: "page", value: "\(page)"),
//            URLQueryItem(name: "size", value: "\(size)")
//        ]
//
//        var request = URLRequest(url: component.url!)
//        request.httpMethod = HTTPMethod.GET.rawValue
//        request.setValue("KakaoAK \(Config.apiKey)", forHTTPHeaderField: "Authorization")
        
        guard let compoenet = makeURLComponents(url: Endpoint.search.urlString, params: [
            "query": "\(query)",
            "page" : "\(page)",
            "size" : "\(size)"
        ]) else { return }
        let request = makeURLRequestFromComponent(component: compoenet, header: ("KakaoAK \(Config.apiKey)", "Authorization"))
        
        URLSession.requestResultType(endpoint: request, completion: completion)
    }
    
    static func makeURLComponents(url: String, params: [String: String]) -> URLComponents? {
        guard var component = URLComponents(string: url) else { return nil}
        component.queryItems = params.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        return component
    }
    
    static func makeURLRequestFromComponent(component: URLComponents, method: HTTPMethod = .GET, header: (String, String)) -> URLRequest {
        var request = URLRequest(url: component.url!)
        request.httpMethod = method.rawValue
        request.setValue(header.0, forHTTPHeaderField: header.1)
        return request
    }
    

}
