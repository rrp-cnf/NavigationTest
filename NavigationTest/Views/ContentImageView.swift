//
//  ContentImageView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/7/24.
//

import SwiftUI

struct ContentImageView: View {
    
    var url: String
    
    var body: some View {
        if let url = URL(string: url) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320)
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(systemName: "photo.artframe")
                .resizable()
                .scaledToFit()
                .frame(width: 320)
        }
    }
}

#Preview {
    ContentImageView(url: contentData1.cover)
}

#Preview {
    ContentImageView(url: "")
}
