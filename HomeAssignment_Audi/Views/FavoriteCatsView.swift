//
//  FavoriteCatsView.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import SwiftUI

struct FavoriteCatsView: View {
    @ObservedObject var viewModel: CatListViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.favoriteCats.isEmpty {
                VStack {
                    Image(systemName: "heart.slash.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                        .opacity(0.5)
                        .padding()
                    Text("No favorites yet!")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .transition(.opacity)
                .scaleEffect(viewModel.animateImage ? 1.1 : 1.0)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                        viewModel.animateImage = true
                    }
                }
            } else {
                List {
                    ForEach(viewModel.favoriteCats) { cat in
                        CatRowView(cat: cat, isFavorite: true, viewModel: viewModel
                                   , onClick: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                viewModel.favoriteCats.removeAll { $0.id == cat.id }
                            }
                        }
                        )
                    }
                    .onDelete { indexSet in
                        withAnimation(.easeInOut(duration: 0.3)) {
                            viewModel.favoriteCats.remove(atOffsets: indexSet)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .sheet(item: $viewModel.selectedCat) { cat in
                    CatDetailView(cat: cat)
                }
            }
        }
        .navigationTitle("Favorites")
    }
}
