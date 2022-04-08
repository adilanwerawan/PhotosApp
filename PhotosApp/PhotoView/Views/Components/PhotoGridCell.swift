//
//  PhotoGridView.swift
//  PhotosApp
//
//  Created by MacBook on 08/04/2022.
//

import SwiftUI

struct PhotoGridCell: View {
    var photoModel:PhotoCellViewModel
    let constantWidthHeight = 80.0
    var body: some View {
        URLPhoto.LoadPhoto(url: photoModel.getPreviewImageURL(), width: constantWidthHeight, height: constantWidthHeight)
    }
}
