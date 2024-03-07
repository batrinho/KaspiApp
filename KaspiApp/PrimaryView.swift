//
//  ContentView.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 20.02.2024.
//

import SwiftUI

struct PrimaryView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            MainView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .frame(height: 17.5)
                        Text("Главная")
                            .font(.system(size: 10))
                    }
                }
                .tag(Tab.main)

            TransactionsView()
                .tabItem {
                    VStack {
                        Image(systemName: "tengesign.arrow.circlepath")
                            .frame(height: 17.5)
                        Text("Переводы")
                            .font(.system(size: 10))
                    }
                }
                .tag(Tab.transactions)

            ProfileView(context: modelContext, networkingService: NetworkingService())
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                            .frame(height: 17.5)
                        Text("Профиль")
                            .font(.system(size: 10))
                    }
                }
                .tag(Tab.profile)
        }
        .tint(.red)
    }
}
