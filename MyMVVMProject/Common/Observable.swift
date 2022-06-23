//
//  Observable.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import Foundation

final class Observable<T> {
    private var listener: ( (T) -> Void )?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ clouser: @escaping (T) -> Void) {
        clouser(value)
        listener = clouser
    }
}
