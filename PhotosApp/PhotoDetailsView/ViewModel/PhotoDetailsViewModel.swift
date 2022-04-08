//
//  PhotoDetailsViewModel.swift
//  PhotosApp
//
//  Created by MacBook on 08/04/2022.
//

import Foundation
import UIKit


protocol PhotoDetailsViewModelProtocol {
    func getImageURL() -> URL?
    func getPresentableUserName() -> String
}

struct PhotoDetailsViewModel:PhotoDetailsViewModelProtocol, Hashable, Identifiable {
    
    let id : Int
    let largeImageURL : String
    let tags : String
    let user : String
    
    func getImageURL() -> URL? {
        guard let url = URL(string: largeImageURL) else {
            return nil
        }
        return url
    }
    
    func getPresentableUserName() -> String{
        return "Posted by : \(user)"
    }
}
