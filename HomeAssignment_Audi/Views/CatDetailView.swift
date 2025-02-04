//
//  CatDetailView.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import SwiftUI
import Kingfisher

struct CatDetailView: View {
    let cat: Cat
    
    var body: some View {
        VStack(spacing: 20) {
            KFImage(URL(string: cat.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                .padding()
                .transition(.scale)
            
            Text(cat.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(cat.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}
