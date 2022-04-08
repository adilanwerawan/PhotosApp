//
//  Photo.swift
//  PhotosApp
//
//  Created by MacBook on 05/04/2022.
//

import Foundation
typealias Photos = [Photo]

struct Photo : Codable {
    
    let id : Int
    let largeImageURL : String
    let previewURL : String
    let tags : String
    let user : String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case largeImageURL = "largeImageURL"
        case previewURL = "previewURL"
        case tags = "tags"
        case user = "user"
    }
}
