//
//  Reusable.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String {
        get
    }
}
