//
//  Config.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let kakoApiKey = "KAKAO_KEY"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    
    static let apiKey: String = {
        guard let apiKey = Config.infoDictionary[Keys.Plist.kakoApiKey] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}
