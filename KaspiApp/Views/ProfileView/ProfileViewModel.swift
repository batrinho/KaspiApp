//
//  ImageCollectionViewModel.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 07.02.2024.
//

import SwiftUI
import SwiftData

final class ProfileViewModel: ObservableObject {
    var context: ModelContext
    
    var selectedImage: Image = Image(systemName: "person.crop.circle")
    var images = [Image]()
    
    var nameInput: String = ""
    var surnameInput: String = ""
    
    private let networkingService: NetworkingServiceProtocol
    init(context: ModelContext, networkingService: NetworkingServiceProtocol) {
        self.context = context
        self.networkingService = networkingService
    }
    
    func loadImages() {
        images.removeAll()
        networkingService.loadImage { [weak self] image in
            guard let self,
                  let image
            else {
                return
            }
            DispatchQueue.main.async {
                self.images.append(image)
            }
        }
    }
    
    func loadLocalData() {
        let request = FetchDescriptor<ProfileData>()
        let data = try? context.fetch(request)
        nameInput = data?.last?.name ?? ""
        surnameInput = data?.last?.surname ?? ""
    }
    
    func updateNameSurname() {
        context.insert(ProfileData(name: nameInput, surname: surnameInput))
        try? context.save()
    }
    
    func selectImage(_ image: Image) {
        selectedImage = image
    }
}
