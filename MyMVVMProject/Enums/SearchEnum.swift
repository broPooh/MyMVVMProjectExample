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
    case startPage = 1
    case size = 30
}
