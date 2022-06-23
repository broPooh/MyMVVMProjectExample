//
//  DetailViewModel.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import Foundation

class DetailViewModel: BaseViewModel {
        
    var kakaoImage: Observable<Document> = Observable(Document(collection: "", thumbnailURL: "", imageURL: "", width: 0, height: 0, displaySitename: "", docURL: "", datetime: ""))
    
    init(kakoImage: Observable<Document>) {
        self.kakaoImage = kakoImage
    }
    
}
