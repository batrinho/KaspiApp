//
//  ProfileData.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 21.02.2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class ProfileData {
    var name: String
    var surname: String
    
    init(name: String, surname: String) {
//        self.image = image
        self.name = name
        self.surname = surname
    }
}
