//
//  ContenListItemView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/7/24.
//

import SwiftUI

struct ContentListItemView: View {
    var content: ContentViewModel

    var body: some View {
            HStack(alignment: .center, spacing: 16) {
                ContentImageView(url: content.cover)
                    .frame(width: 320)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(content.title)
                        .font(.headline)
                        .bold()
                        .lineLimit(1)
                    Text(content.cover)
                        .font(.subheadline)
                        .lineLimit(1)
                    Text(content.contentUrl)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

#Preview {
    ContentListItemView(content: contentData3)
}
