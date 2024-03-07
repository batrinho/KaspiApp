//
//  KaspiAppApp.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 16.01.2024.
//

import SwiftUI
import SwiftData

@main
struct KaspiAppApp: App {
    @StateObject var coordinator = Coordinator()
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            PrimaryView()
                .environmentObject(coordinator)
        }
        .modelContainer(container)
    }
    
    init() {
        do {
            container = try ModelContainer(for: ProfileData.self)
        } catch {
            fatalError("Failed to create ModelContainer for Movie.")
        }
    }
}
