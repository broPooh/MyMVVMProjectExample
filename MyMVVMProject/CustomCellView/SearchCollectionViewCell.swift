//
//  SearchCollectionViewCell.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import UIKit
import SnapKit

final class SearchCollectionViewCell: UICollectionViewCell {
        
    let searchImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchImageView)
        searchImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage(kakoImage: Document) {
        searchImageView.setImage(imageUrl: kakoImage.thumbnailURL)
    }
    
    
}

