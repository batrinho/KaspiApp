//
//  Coordinator.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 19.02.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case main
    case transactions
    case profile
}

@MainActor
final class Coordinator: ObservableObject {
    @Published var selectedTab: Tab = .profile
    @Published var isImageCollectionViewPresented = false
    
    func navigateTo(tab: Tab) {
        selectedTab = tab
    }
    
    func presentImageCollectionView() {
        isImageCollectionViewPresented = true
    }
    
    func dismissImageCollectionView() {
        isImageCollectionViewPresented = false
    }
}

