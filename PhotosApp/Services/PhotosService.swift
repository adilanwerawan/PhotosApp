//
//  RestaurantsListService.swift
//  RestaurantList
//
//  Created by MacBook on 05/04/2022.
//

import Foundation

protocol PhotosServiceProtocol {
    func getPhotos(url:String,completion: @escaping (_ success: Bool, _ results: Photos?, _ error: String?) -> ())
}

class PhotosService: PhotosServiceProtocol {
    func getPhotos(url:String,completion: @escaping (Bool, Photos?, String?) -> ()) {
        HttpRequestHelper().GET(url: url, params: nil, httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(RootPhotoModel.self, from: data!)
                    completion(true, model.photos, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse photo to model")
                }
            } else {
                completion(false, nil, "Error: Photo GET Request failed")
            }
        }
    }
}
