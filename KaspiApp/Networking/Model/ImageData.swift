//
//  ImageData.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 06.02.2024.
//

import Foundation

struct ImageModel: Decodable {
    let urls: ImageUrl
}

struct ImageUrl: Decodable {
    let small: String
}
