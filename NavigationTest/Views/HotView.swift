//
//  HotView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 6/7/24.
//

import SwiftUI

struct HotView: View {
    
    let contentList: [ContentViewModel] = contentListData
    
    @EnvironmentObject private var router: NavigationModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(contentList) { content in
                    Button(action: {
                        router.navigate(to: content, preferredNavigationType: .push)
                    }, label: {
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
