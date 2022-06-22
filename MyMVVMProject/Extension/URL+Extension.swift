//
//  URL+Extension.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/21.
//

import Foundation

extension URL {
    
    static let kakaoBaseURL = "https://dapi.kakao.com/"
    
    static func makeEndPoint(_ endpoint: String) -> URL {
        URL(string: kakaoBaseURL + endpoint)!
    }
    
    static func makeEndPointString(_ endpoint: String) -> String {
        return kakaoBaseURL + endpoint
    }
}
