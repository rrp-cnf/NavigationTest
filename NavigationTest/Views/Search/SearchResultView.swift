//
//  SearchResultView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/7/24.
//

import SwiftUI

struct SearchResultView: View {
    @Binding var searchText: String
    @State private var searchResults: [ContentViewModel] = contentListData
    
    var body: some View {
        VStack {
            if searchText.isEmpty {
                Text("Empieza a escribir para buscar")
            } else if searchResults.isEmpty {
                Text("No se ha encontrado ningún contenido para \(searchText)")
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(searchResults) { content in
                            NavigationLink(value: content, label:{
                                ContentListItemView(content: content)
                                    .navigationTitle("Búsqueda")
                            })
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .onChange(of: searchText) {
            if searchText.count > 0 {
                let lowercasedText = searchText.lowercased()
                self.searchResults = contentListData.filter {
                    $0.title.lowercased().contains(lowercasedText)
                }
            }
        }
    }
}

#Preview {
    SearchResultView(searchText: .constant("econo"))
}
