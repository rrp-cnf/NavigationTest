//
//  ListView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 7/7/24.
//

import SwiftUI

struct ListView: View {
    let content: ContentViewModel
    
    var body: some View {
        if let contents = content.contents {
            ScrollView {
                LazyVStack {
                    ForEach(contents) { content in
                        NavigationLink(value: content, label: {
                            ContentListItemView(content: content)
                        })
                    }
                    .padding(.horizontal)
                }
            }
        } else {
            Text("No hay contenidos asociados")
        }
    }
}

#Preview {
    ListView(content: contentData2)
}
