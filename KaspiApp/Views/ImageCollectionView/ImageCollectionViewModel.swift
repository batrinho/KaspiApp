//
//  ImageCollectionViewModel.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 07.02.2024.
//

import UIKit
import SwiftUI

final class ImageCollectionViewModel: ObservableObject {
    @Published var images = [Image]()
    private let networkingService: NetworkingServiceProtocol
    
    init(networkingService: NetworkingServiceProtocol) {
        self.networkingService = networkingService
        self.loadImages()
    }
    
    func loadImages() {
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
}
