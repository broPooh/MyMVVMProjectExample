//
//  APIEnum.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/21.
//

import Foundation

enum NetworkHeader: String {
    case authorization = "Authorization"
}

enum NetworkHeaderField {
    case kakaAuthorization
    
    var field: String {
        switch self {
        case .kakaAuthorization: return "KakaoAK \(Config.apiKey)"
        }
    }
}

enum KakaoStatusCode: Int {
    case ok = 200
}

enum KaokaoAPISearchError: Int, Error {
    case badRequest = 400
    case unAuthorized = 401
    case forbidden = 403
    case tooManyRequest = 429
    case internalServerError = 500
    case badGateway = 502
    case serviceUnavailable = 503
    case unknown
    case failed
    case invalidResponse
    case noData
    case invalidData


    var description: String { self.errorDescription }
}

extension KaokaoAPISearchError {

    var errorDescription: String {
        switch self {
        case .badRequest: return "400: 일반적인 오류"
        case .unAuthorized: return "401: 인증 오류"
        case .forbidden: return "403: 권한 오류"
        case .tooManyRequest: return "429: 쿼터 초과"
        case .internalServerError: return "500: 시스템 오류"
        case .badGateway: return "502: 시스템 오류"
        case .serviceUnavailable: return "503: 서비스 점검중"
        case .failed: return "네트워크통신 실패"
        case .invalidData: return "시리얼라이즈 실패"
        default: return "UN_KNOWN_ERROR"
        }
    }
}
