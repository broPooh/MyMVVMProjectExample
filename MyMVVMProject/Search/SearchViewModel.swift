//
//  SearchViewModel.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/21.
//

import Foundation

class SearchViewModel {
    
    var query: String = ""
    var currentPage: Int = 1

    var kakaoResponse: Observable<KaKaoImageResponse> = Observable(KaKaoImageResponse(meta: Meta(totalCount: 0, pageableCount: 0, isEnd: false), documents: []))
    var kakaoImages: Observable<[Document]> = Observable([])
    var isLoading: Observable<Bool> = Observable(false)
       
    func searchImage(query: String) {
        isLoading.value = true
        self.query = query
        APIService.searchImage(query: query, page: currentPage) { result in
            switch result {
            case .success(let response):
                self.isLoading.value = false
                
                //self.kakaoResponse = response
                self.kakaoResponse.value = response
                //self.kakaoImages = response.documents
                self.kakaoImages.value = response.documents
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
    func fetchImage() {
        isLoading.value = true
        APIService.searchImage(query: query, page: currentPage) { result in
            switch result {
            case .success(let response):
                self.isLoading.value = false
                //self.kakaoResponse = response
                self.kakaoResponse.value = response
                //self.kakaoImages.append(contentsOf: response.documents)
                self.kakaoImages.value.append(contentsOf: response.documents)
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
}
