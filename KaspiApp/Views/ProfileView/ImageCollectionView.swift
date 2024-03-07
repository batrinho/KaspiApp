//
//  ImageCollectionView.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 03.02.2024.
//

import SwiftUI
import UIKit

struct ImageCollectionView: View {
    @EnvironmentObject private var viewModel: ProfileViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            indicator
            navBar
            collectionView
        }
        .onAppear {
            viewModel.loadImages()
        }
    }
    
    @ViewBuilder
    private var indicator: some View {
        HStack {
            Spacer()
            Image(systemName: "minus")
                .imageScale(.large)
                .font(Font.title.weight(.heavy))
                .foregroundColor(Color(UIColor.tertiaryLabel))
            Spacer()
        }
    }
    
    private var navBar: some View {
        ZStack {
            HStack {
                Text("Фото с интернета")
                    .font(.headline)
                    .padding()
            }
            HStack {
                Spacer()
                Button {
                    coordinator.dismissImageCollectionView()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
        }
    }
    
    private var collectionView: some View {
        let columns = [
            GridItem(.adaptive(minimum: 120))
        ]
        return ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<30) { index in
                    imageFor(index)
                }
            }
        }
    }
    
    private func imageFor(_ index: Int) -> some View {
        return ZStack(alignment: .center) {
            if let image = viewModel.images[safe: index] {
                image
                    .resizable()
                    .frame(width: 120, height: 120)
                    .scaledToFill()
                    .onTapGesture {
                        viewModel.selectImage(image)
                        coordinator.dismissImageCollectionView()
                    }
            } else {
                ProgressView()
                    .padding(50)
            }
        }
    }
}

fileprivate extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
