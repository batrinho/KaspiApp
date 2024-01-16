//
//  NameTextField.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 16.01.2024.
//

import SwiftUI

struct NameTextField: View {
    @State private var userInput: String = ""
    @State var placeholder: String
    
    var body: some View {
        HStack {
            Text(placeholder)
                .foregroundColor(.black)
                .bold()
                .padding(.leading)
            TextField("", text: $userInput)
        }
        .padding()
        .background(Color(.white))
    }
}
