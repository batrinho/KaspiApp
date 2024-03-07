//
//  ProfileView.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 15.01.2024.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator    
    @State private var viewModel: ProfileViewModel
    
    @FocusState var isNameFocused: Bool
    @FocusState var isSurnameFocused: Bool
    
    init(context: ModelContext, networkingService: NetworkingServiceProtocol) {
        let viewModel = ProfileViewModel(context: context, networkingService: networkingService)
        _viewModel = State(initialValue: viewModel)
        viewModel.loadLocalData()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            logoView
            nameTextField(placeholder: "Name: ", input: $viewModel.nameInput, focused: $isNameFocused)
                .padding([.top, .bottom])
            nameTextField(placeholder: "SurName: ", input: $viewModel.surnameInput, focused: $isSurnameFocused)
            Spacer()
        }
        .background(Color(.backgroundGray))
        .sheet(isPresented: $coordinator.isImageCollectionViewPresented) {
            ImageCollectionView()
                .environmentObject(viewModel)
            .presentationDetents([.fraction(0.7)])
        }
    }
    
    private var logoView: some View {
        ZStack {
            Color("LogoViewColor")
            Button {
                coordinator.presentImageCollectionView()
            } label: {
                ZStack(alignment: .bottomTrailing) {
                    viewModel.selectedImage
                        .resizable()
                        .frame(width: 79, height: 79)
                        .cornerRadius(79)
                        .scaledToFill()
                        .foregroundStyle(.white)
                    Image(systemName: "camera.circle.fill")
                        .foregroundStyle(.red)
                        .background(Color(.white))
                        .cornerRadius(21)
                        .font(.system(size: 21))
                }
            }
        }
        .frame(height: 164)
    }
    
    @ViewBuilder
    private func nameTextField(placeholder: String, input: Binding<String>, focused: FocusState<Bool>.Binding) -> some View {
        HStack {
            TextField(placeholder, text: input)
                .focused(focused)
            Image(focused.wrappedValue ? "done" : "pen")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    focused.wrappedValue.toggle()
                    if focused.wrappedValue == true {
                        viewModel.updateNameSurname()
                    }
                }
        }
        .padding()
        .background(Color(.white))
    }
}

