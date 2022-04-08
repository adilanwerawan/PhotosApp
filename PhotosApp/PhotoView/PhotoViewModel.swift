//
//  PhotoViewModel.swift
//  PhotosApp
//
//  Created by MacBook on 05/04/2022.
//

import Foundation
class PhotoViewModel: NSObject {
    
    private var photoService: PhotosServiceProtocol
    
    var reloadView: (() -> Void)?
    
    private var photos = Photos()
    
    private var sortedByDistance = true
    
    var photoCellViewModels = [PhotoCellViewModel]() {
        didSet {
            reloadView?()
        }
    }
    
    init(photoService: PhotosServiceProtocol = PhotosService()) {
        self.photoService = photoService
    }
    
    func getPhotos() {
        photoService.getPhotos(url: AppConfig.photoListURL) { success, model, error in
            if success, let photos = model {
                self.fetchData(photos: photos)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(photos: Photos) {
        self.photos = photos // Cache
        var vms = [PhotoCellViewModel]()
        for photo in photos {
            vms.append(createCellViewModel(photo: photo))
        }
        photoCellViewModels = vms
    }
    
    func createCellViewModel(photo: Photo) -> PhotoCellViewModel {
        return PhotoCellViewModel(id: photo.id, previewURL: photo.previewURL)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PhotoCellViewModel {
        return photoCellViewModels[indexPath.row]
    }
    
    func getPhotoDetailsViewModel(from photoId:Int) -> PhotoDetailsViewModel?{
        if let index = self.photos.firstIndex(where: {$0.id == photoId}) {
            // do something with fooOffset
            let photo = self.photos[index]
            return PhotoDetailsViewModel(id: photo.id, largeImageURL: photo.largeImageURL, tags: photo.tags, user: photo.user)
        }
        return nil
    }
}
