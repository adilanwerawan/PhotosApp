//
//  RootPhotoModel.swift
//  PhotosApp
//
//  Created by MacBook on 08/04/2022.
//

import Foundation
struct RootPhotoModel : Codable {
    
    let photos : [Photo]?
    let total : Int?
    let totalHits : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case photos = "hits"
        case total = "total"
        case totalHits = "totalHits"
    }
}
