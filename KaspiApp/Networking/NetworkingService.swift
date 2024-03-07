//
//  NetworkingService.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 06.02.2024.
//

import UIKit
import SwiftUI

protocol NetworkingServiceProtocol {
    func loadImage(completion: @escaping (Image?) -> ())
}

final class NetworkingService {
    private enum Constants {
        static let url = "https://api.unsplash.com/photos/random?client_id=6-SD-MGwAsJvWqs0Hs6O5v25SX3k5nBIu3M41indr6Y&count=30"
    }
    
    private func getImageModels(completion: @escaping ([ImageModel]?) -> ()) {
        Task {
            guard let url = URL(string: Constants.url) else {
                completion(nil)
                return
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let result = try decoder.decode([ImageModel].self, from: data)
                completion(result)
            }
        }
    }
}

extension NetworkingService: NetworkingServiceProtocol {
    func loadImage(completion: @escaping (Image?) -> ()) {
        getImageModels { imageModels in
            guard let imageModels else {
                return
            }
            for imageModel in imageModels {
                guard let url = URL(string: imageModel.urls.small) else {
                    completion(nil)
                    continue
                }
                self.fetchImage(url: url) { image in
                    guard let image else {
                        completion(nil)
                        return
                    }
                    completion(Image(uiImage: image))
                }
            }
        }
    }
    
    private func fetchImage(url: URL, completion: @escaping (UIImage?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }.resume()
    }
}
