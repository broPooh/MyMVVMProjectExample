//
//  BaseUIView.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import UIKit
import SnapKit

class BaseUIView: UIView, ViewRepresentable {

    func setupView() { }

    func setupConstraints() { }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
}

