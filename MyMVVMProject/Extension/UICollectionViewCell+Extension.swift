//
//  UICollectionViewCell+Extension.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import UIKit

extension UICollectionViewCell: Reusable {
   static var reuseIdentifier: String {
        return String(describing: self)
    }
}
