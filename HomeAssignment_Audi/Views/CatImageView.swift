//
//  CatImageView.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 5/02/25.
//

import SwiftUI
import Kingfisher

struct CatImageView: View {
    let url: String

    var body: some View {
        if url.starts(with: "http") {
            KFImage(URL(string: url))
                .resizable()
                .placeholder {
                    ProgressView()
                }
                .scaledToFit()
        } else {
            Image(url)
                .resizable()
                .scaledToFit()
        }
    }
}
