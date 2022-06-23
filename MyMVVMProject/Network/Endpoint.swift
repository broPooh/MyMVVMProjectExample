//
//  Endpoint.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/21.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case PUT
    case POST
    case DELETE
}

enum Endpoint {
    case search
}

extension Endpoint {
    var urlString: String {
        switch self {
        case .search: return URL.makeEndPointString("v2/search/image")
        }
    }
}
