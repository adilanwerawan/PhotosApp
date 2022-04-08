//
//  PhotoDetailsView.swift
//  PhotosApp
//
//  Created by MacBook on 08/04/2022.
//

import SwiftUI

struct PhotoDetailsView: View {
    var viewModel:PhotoDetailsViewModel
    var body: some View {
        VStack{
            URLPhoto.LoadPhoto(url: viewModel.getImageURL(), padding: 8.0, height: 200.0)
                .aspectRatio(contentMode: .fit)
            Text(viewModel.getPresentableUserName())
                .font(.system(size: 18.0, weight: .semibold))
                .foregroundColor(.blue)
                .padding(.top, 12)
            Text(viewModel.tags)
                .font(.system(size: 18.0, weight: .semibold))
                .foregroundColor(.orange)
                .padding(.top, 12)
            Spacer()
        }
        .padding(8)
    }
}
