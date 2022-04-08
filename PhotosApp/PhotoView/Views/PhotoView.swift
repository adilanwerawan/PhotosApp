//
//  PhotoView.swift
//  PhotosApp
//
//  Created by MacBook on 05/04/2022.
//

import SwiftUI

struct PhotoView: View {
    /// WIdth and hight of the photo
    let constantWidthHeight = 80.0
    private let viewModel:PhotoViewModel = PhotoViewModel()
    @State var isReload = false
    @State var moveToDetailsView = false
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple]
    @State var columns = [GridItem]()
    
    var body: some View {
        VStack{
            if isReload{
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: columns) {
                        ForEach((viewModel.photoCellViewModels)) { photo in
                            ZStack{
                                PhotoGridCell(photoModel: photo)
                                    .onTapGesture {
                                        moveToDetailsView = true
                                    }
                                if let detailsVM = viewModel.getPhotoDetailsViewModel(from: photo.id){
                                    NavigationLink(destination: PhotoDetailsView(viewModel: detailsVM), isActive: $moveToDetailsView) {}
                                }
                            }
                        }
                    }
                }
                .padding(.top, 5)
                .padding([.leading, .trailing], 6)
            } else {
                ProgressView()
            }
        }
        .padding(0)
        .navigationBarTitle("Photos", displayMode: .inline)
        .onAppear(){
            // Get photos data
            viewModel.getPhotos()
            // Set grid layout
            columns = [GridItem(.adaptive(minimum: constantWidthHeight, maximum: constantWidthHeight))]
            // Reload list
            viewModel.reloadView = {
                DispatchQueue.main.async {
                    isReload = true
                }
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
