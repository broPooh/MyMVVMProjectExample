//
//  Config.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import Foundation

struct Config {
    
    enum PlistKeys: String {
        case kakoApiKey = "KAKAO_KEY"
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    
    static let apiKey: String = {
        guard let apiKey = Config.infoDictionary[PlistKeys.kakoApiKey.rawValue] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}
