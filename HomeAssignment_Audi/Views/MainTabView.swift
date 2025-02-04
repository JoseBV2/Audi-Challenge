//
//  MainTabView.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = CatListViewModel()
    
    var body: some View {
        TabView {
            CatListView(viewModel: viewModel)
                .tabItem {
                    Label("Cats", systemImage: "list.bullet")
                }
            FavoriteCatsView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
        .tint(.purple)
    }
}
