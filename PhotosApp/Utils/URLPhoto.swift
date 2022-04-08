//
//  URLPhotoLibrary.swift
//  PhotosApp
//
//  Created by MacBook on 08/04/2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct URLPhoto{
    
    // MARK: we can change later on image loading library e.g : Instead Kingfisher use SDWebImage
    @ViewBuilder
    static func LoadPhoto(url:URL?, width:CGFloat, height:CGFloat) -> some View {
        if let url = url{
            KFImage.url(url)
                .resizable()
                .placeholder { Placeholder() }
                .frame(width: width, height: height)
        }
    }
    
    @ViewBuilder
    static func LoadPhoto(url:URL?, padding:CGFloat, height:CGFloat) -> some View {
        if let url = url{
            KFImage.url(url)
                .resizable()
                .placeholder { Placeholder() }
                .frame(height: height)
                .padding(padding)
        }
    }
    
    @ViewBuilder
    private static func Placeholder() -> some View {
        Image(systemName: "photo").padding(0)
    }
}
