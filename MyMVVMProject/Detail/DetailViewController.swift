//
//  DetailViewController.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import UIKit

class DetailViewController: BaseViewController {

    private let detailView: DetailView!
    private let viewModel: BaseDetailViewModel!

    init(view: DetailView, viewModel: BaseDetailViewModel) {
        self.detailView = view
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = detailView
    }
            
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationConfigure()
        bind()
    }
    
    func bind() {
        
        detailView.dismissButton.addTarget(self, action: #selector(dismissDetailView), for: .touchUpInside)
        
        viewModel.kakaoImage.bind { [weak self] kakaoImage in
            
            self?.detailView.detailImageView.setImage(imageUrl: kakaoImage.imageURL)

            self?.detailView.siteLable.isHidden = kakaoImage.displaySitename != nil ? false : true
            self?.detailView.siteLable.text = kakaoImage.displaySitename ?? ""
            
            self?.detailView.dateLable.isHidden = kakaoImage.datetime != nil ? false : true
            
            if let dateTime = kakaoImage.datetime {
                let date = dateTime.toDate
                self?.detailView.dateLable.text = date.toString
            }
        }

    }
    
    private func navigationConfigure() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: SystemImage.xmark.rawValue), style: .plain, target: self, action: #selector(dismissDetailView))
    }
    
    @objc func dismissDetailView() {
        dismiss(animated: true, completion: nil)
    }
    


}
