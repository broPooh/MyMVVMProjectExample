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
        guard var component = URLComponents(string: Endpoint.search.urlString) else { return }
        component.queryItems = [
            URLQueryItem(name: "query", value: "\(query)"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "size", value: "\(size)")
        ]
        
        var request = URLRequest(url: component.url!)
        request.httpMethod = HTTPMethod.GET.rawValue
        request.setValue("KakaoAK \(APIKEY.key)", forHTTPHeaderField: "Authorization")
        
        URLSession.requestResultType(endpoint: request, completion: completion)
    }

}
