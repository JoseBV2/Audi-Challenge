//
//  CatRowView.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import SwiftUI
import Kingfisher

struct CatRowView: View {
    
    let cat: Cat
    @State var isFavorite = false
    @ObservedObject var viewModel: CatListViewModel
    @State private var animateHeart = false
    var onClick: () -> Void = { }
    
    init(cat: Cat, isFavorite: Bool = false, viewModel: CatListViewModel, onClick: @escaping () -> Void = { }) {
        self.cat = cat
        self.isFavorite = isFavorite
        self.viewModel = viewModel
        self.onClick = onClick
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: cat.imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(cat.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(cat.temperament)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    animateHeart.toggle()
                }
                if isFavorite {
                    onClick()
                } else {
                    viewModel.toggleFavorite(cat: cat)
                }
            }) {
                Image(systemName: viewModel.favoriteCats.contains(where: { $0.id == cat.id }) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .scaleEffect(animateHeart ? 1.3 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5), value: animateHeart)
                    .foregroundColor(.red)
                    .scaleEffect(animateHeart ? 1.3 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5), value: animateHeart)
                    .padding()
                    .accessibilityIdentifier("favoriteButton")
            }
            .onChange(of: animateHeart) { oldValue, newValue in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    animateHeart = false
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding(.vertical, 5)
    }
}
