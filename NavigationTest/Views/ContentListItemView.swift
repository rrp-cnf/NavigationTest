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
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(content.title)
                        .font(.headline)
                        .bold()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

#Preview {
    ContentListItemView(content: contentData3)
}
