//
//  DetailViewModel.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import Foundation

protocol DetailViewModelInput {

}

protocol DetailViewModelOutput {
    var kakaoImage: Observable<Document> { get set }
}


protocol BaseDetailViewModel: DetailViewModelInput, DetailViewModelOutput { }

class DetailViewModel: BaseDetailViewModel {
    
    var kakaoImage: Observable<Document>

    init(kakoImage: Observable<Document>) {
        self.kakaoImage = kakoImage
    }
    
}
