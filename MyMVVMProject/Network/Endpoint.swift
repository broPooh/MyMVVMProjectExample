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

//json 모델인데 왜 여기있을까.?
struct ErrorBody: Codable {
    let statusCode: Int
    let error, message: String
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
