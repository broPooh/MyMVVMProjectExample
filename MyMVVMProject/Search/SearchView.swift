//
//  SearchView.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import UIKit
import SnapKit
import JGProgressHUD

class SearchView: BaseUIView {
    
    var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let spacing = CGFloat(CollectionSize.spacing.rawValue)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.reuseIdentifier)
        
        collectionView.indicatorStyle = .default
        return collectionView
    }()
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.setImage(UIImage(named: SystemImage.icSearchNonW.rawValue), for: UISearchBar.Icon.search, state: .normal)
        searchBar.setImage(UIImage(named: SystemImage.icCancel.rawValue), for: .clear, state: .normal)

        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.backgroundColor = .darkGray
        searchBar.searchTextField.leftView?.tintColor = .lightGray
        searchBar.searchTextField.rightView?.tintColor = .white
        return searchBar
    }()
    
    var noDataLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과가 없습니다."
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    let hud = JGProgressHUD()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    override func setupView() {
        super.setupView()
        addSubview(searchCollectionView)
        addSubview(noDataLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        
        searchCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        noDataLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func showProgress() {
        hud.show(in: self)
    }
    
    func dissmissProgress() {
        hud.dismiss()
    }

  
}
