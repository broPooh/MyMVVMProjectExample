//
//  KaKaoModel.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/21.
//

import Foundation

// MARK: - KaKaoImageResponse
struct KaKaoImageResponse: Codable {
    let meta: Meta
    let documents: [Document]
}

// MARK: - Document
struct Document: Codable {
    let collection: String
    let thumbnailURL: String
    let imageURL: String
    let width, height: Int
    let displaySitename: String?
    let docURL: String?
    let datetime: String?

    enum CodingKeys: String, CodingKey {
        case collection
        case thumbnailURL = "thumbnail_url"
        case imageURL = "image_url"
        case width, height
        case displaySitename = "display_sitename"
        case docURL = "doc_url"
        case datetime
    }
}

// MARK: - Meta
struct Meta: Codable {
    let totalCount, pageableCount: Int
    let isEnd: Bool

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case pageableCount = "pageable_count"
        case isEnd = "is_end"
    }
}


//json 모델인데 왜 여기있을까.?
//struct ErrorBody: Codable {
//    let statusCode: Int
//    let error, message: String
//}
