//
//  DetailView.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import UIKit
import SnapKit

final class DetailView: BaseUIView {
    
    let scrollView = UIScrollView()
    
    let detailImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .trailing
        stackView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        return stackView
    }()
    
    let dismissButton = UIButton()
    
    let siteLable = UILabel()
    let dateLable = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        labelConfig()
        buttonConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    override func setupView() {
        super.setupView()
        
                
        addSubview(scrollView)
        scrollView.addSubview(detailImageView)
        scrollView.addSubview(labelStackView)
        labelStackView.addArrangedSubview(siteLable)
        labelStackView.addArrangedSubview(dateLable)
        addSubview(dismissButton)

    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            
            //$0.edges.equalToSuperview()
        }
        
        dismissButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(10)
            $0.width.height.equalTo(50)
        }
        
        detailImageView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            //$0.top.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            //$0.bottom.equalToSuperview().priority(.low)
            
            $0.height.greaterThanOrEqualTo(100).priority(.low)
        }
                
        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(detailImageView.snp.leading)
            $0.trailing.equalTo(detailImageView.snp.trailing)
            $0.bottom.equalTo(detailImageView.snp.bottom)
        }
        
    }
    
    func labelConfig() {
        siteLable.textColor = .white
        dateLable.textColor = .white
    }
    
    func buttonConfig() {
        dismissButton.setImage(UIImage(systemName: SystemImage.xmark.rawValue), for: .normal)
        dismissButton.tintColor = .white
    }

  
}
