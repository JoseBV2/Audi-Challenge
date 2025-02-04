//
//  CatListViewModel.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import SwiftUI
import Combine

class CatListViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    @Published var filteredCats: [Cat] = []
    @Published var favoriteCats: [Cat] = [] {
        didSet {
            saveFavorites()
        }
    }
    @Published var isLoading: Bool = false
    @Published var searchText: String = "" {
        didSet {
            filterCats()
        }
    }
    @Published var animateTitle: Bool = false
    @Published var selectedCat: Cat? = nil
    @Published var animateImage: Bool = false
    @Published var errorMessage: String? = nil
    @Published var page: Int = 0
    private let limit = 10
    private var canLoadMore = true
    var networkService: NetworkServiceProtocol
    
    
    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
        loadFavorites()
        loadCats()
    }
    
    func loadCats() {
         guard !isLoading, canLoadMore else { return }
         isLoading = true
         
         let url = APIEndpoint.paginatedBreeds(page: page, limit: limit)
         
         NetworkService.shared.fetchData(from: url) { (result: Result<[Cat], Error>) in
             DispatchQueue.main.async {
                 self.isLoading = false
                 switch result {
                 case .success(let fetchedCats):
                     if fetchedCats.isEmpty {
                         self.canLoadMore = false
                     } else {
                         self.cats.append(contentsOf: fetchedCats)
                         self.filteredCats.append(contentsOf: fetchedCats)
                         self.page += 1
                     }
                 case .failure(let error):
                     self.errorMessage = "Error fetching cats."
                         print("Error fetching cats: \(error.localizedDescription)")
                 }
             }
         }
     }
    
    func loadMoreCats(currentCat: Cat) {
        let thresholdIndex = cats.index(cats.endIndex, offsetBy: -3)
        if let index = cats.firstIndex(where: { $0.id == currentCat.id }), index >= thresholdIndex {
            loadCats()
        }
    }
    
    func toggleFavorite(cat: Cat) {
        if favoriteCats.contains(where: { $0.id == cat.id }) {
            favoriteCats.removeAll { $0.id == cat.id }
        } else {
            favoriteCats.append(cat)
        }
    }
    
    private func filterCats() {
        if searchText.isEmpty {
            filteredCats = cats
        } else {
            filteredCats = cats.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favoriteCats) {
            UserDefaults.standard.set(encoded, forKey: "favorites")
        }
    }
    
    func loadFavorites() {
        if let savedData = UserDefaults.standard.data(forKey: "favorites"),
           let decoded = try? JSONDecoder().decode([Cat].self, from: savedData) {
            DispatchQueue.main.async {
                self.favoriteCats = decoded
            }
        }
    }
}
