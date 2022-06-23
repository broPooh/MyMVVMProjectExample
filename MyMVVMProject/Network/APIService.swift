//
//  APIService.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/21.
//

import Foundation

final class APIService {

    private init() { }
    
    static func searchImage(query: String, page: Int, size: Int = SearchQuery.size.rawValue, completion: @escaping (Result<KaKaoImageResponse, KaokaoAPISearchError>) -> Void) {

        guard let compoenet = makeURLComponents(url: Endpoint.search.urlString, params: [
            "query": "\(query)",
            "page" : "\(page)",
            "size" : "\(size)"
        ]) else { return }
        let request = makeURLRequestFromComponent(component: compoenet, header: (NetworkHeaderField.kakaAuthorization.field, NetworkHeader.authorization.rawValue))
        
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
