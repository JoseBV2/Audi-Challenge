//
//  CatListView.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var viewModel: CatListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text(errorMessage)
                            .font(.headline)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button(action: {
                            viewModel.errorMessage = nil
                            viewModel.loadCats()
                        }) {
                            Text("Reintentar")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                } else {
                    ScrollView {
                        TextField("Search cats...", text: $viewModel.searchText)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.filteredCats) { cat in
                                CatRowView(cat: cat, viewModel: viewModel)
                                    .onAppear {
                                        viewModel.loadMoreCats(currentCat: cat)
                                    }
                                    .onTapGesture {
                                        viewModel.selectedCat = cat
                                    }
                            }
                            if viewModel.isLoading {
                                ProgressView()
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("🐾 Cat Explorer 🐱")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.purple.opacity(0.8))
                        .shadow(radius: 2)
                        .scaleEffect(viewModel.animateTitle ? 1.1 : 1.0)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                viewModel.animateTitle = true
                            }
                        }
                }
            }
            .sheet(item: $viewModel.selectedCat) { cat in
                CatDetailView(cat: cat)
            }
        }
        .accentColor(Color.blue.opacity(0.8))
    }
}


#Preview {
    CatListView(viewModel: CatListViewModel())
}
