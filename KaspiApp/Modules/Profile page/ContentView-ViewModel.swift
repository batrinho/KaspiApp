//
//  ContentView-ViewModel.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 17.01.2024.
//

import Foundation
import SwiftUI

enum Tab: String, CaseIterable {
    case main = "house"
    case qr = "qrcode"
    case messages = "message.badge"
    case services = "list.bullet"
}

extension ContentView {
    class ViewModel {
        private var profileImage = Image(systemName: "person.crop.circle")
        func getProfileImage() -> Image {
            return profileImage
        }
        func updateProfileImage(with newProfileImage: Image) {
            profileImage = newProfileImage
        }
    }
}
