//
//  HotView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 6/7/24.
//

import SwiftUI

struct HotView: View {
    let contentList: [ContentViewModel] = contentListData
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(contentList) { content in
                    NavigationLink(value: content, label: {
                        ContentListItemView(content: content)
                    })
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HotView()
}
