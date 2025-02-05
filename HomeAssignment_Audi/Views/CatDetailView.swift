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
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height

            VStack {
                if isLandscape {
                    HStack(spacing: 16) {
                        CatImageView(url: cat.imageURL)
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.6)
                            .cornerRadius(12)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(cat.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)

                            Text(cat.temperament)
                                .font(.headline)
                                .foregroundColor(.gray)

                            Text(cat.origin)
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text(cat.description)
                                .font(.body)
                                .padding(.top, 10)
                        }
                        .frame(width: geometry.size.width * 0.5)
                    }
                    .padding()
                } else {
                    VStack(spacing: 16) {
                        CatImageView(url: cat.imageURL)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
                            .cornerRadius(12)

                        VStack(alignment: .leading, spacing: 8) {
                            Text(cat.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)

                            Text(cat.temperament)
                                .font(.headline)
                                .foregroundColor(.gray)

                            Text(cat.origin)
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text(cat.description)
                                .font(.body)
                                .padding(.top, 10)
                        }
                        .padding()
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
