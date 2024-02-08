//
//  ImageCollectionView.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 03.02.2024.
//

import SwiftUI
import UIKit

struct ImageCollectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = ImageCollectionViewModel(networkingService: NetworkingService())
    @Binding var selectedImage: Image
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Text("Фото")
                        .font(.headline)
                        .padding()
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
            }
            
            ScrollView {
                ForEach(0..<10) { i in
                    HStack {
                        ForEach(0..<3) { j in
                            ZStack(alignment: .center) {
                                //                                AsyncImage(url: URL(string: "https://picsum.photos/120")) { image in
                                //                                    image
                                //                                        .onTapGesture {
                                //                                            selectedImage = image
                                //                                            presentationMode.wrappedValue.dismiss()
                                //                                        }
                                //                                        .scaledToFit()
                                //                                        .frame(width: 120, height: 120)
                                //                                } placeholder: {
                                //                                    ProgressView()
                                //                                        .padding(50)
                                //                                }
                                if let image = viewModel.images[safe: i * 3 + j] {
                                    image
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .scaledToFill()
                                        .onTapGesture {
                                            selectedImage = image
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                } else {
                                    ProgressView()
                                        .padding(50)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
