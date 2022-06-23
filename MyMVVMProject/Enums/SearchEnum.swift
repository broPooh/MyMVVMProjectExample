//
//  SearchEnum.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/23.
//

import Foundation

enum SearchType {
    case auto
    case normal
}

enum SearchQuery: Int {
    static let nextPage = 1
    static let queryDelay = 1
    
    case startPage = 1
    case size = 30
}
