//
//  RestaurantCellViewModel.swift
//  RestaurantList
//
//  Created by MacBook on 05/04/2022.
//

import Foundation

protocol PhotoCellViewModelProtocol {
    func getPreviewImageURL() -> URL?
}

struct PhotoCellViewModel:PhotoCellViewModelProtocol, Hashable, Identifiable {
    
    let id : Int
    let previewURL : String
    
    func getPreviewImageURL() -> URL? {
        guard let url = URL(string: previewURL) else {
            return nil
        }
        return url
    }
}
