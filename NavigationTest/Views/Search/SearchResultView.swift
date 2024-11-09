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

    @EnvironmentObject private var router: NavigationModel

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
                            Button(action: {
                                router.navigate(to: content, preferredNavigationType: .push)
                            }, label: {
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
            do {
                if searchText.count > 0 && searchText.count < 11 {
                    let lowercasedText = searchText.lowercased()
                    self.searchResults = contentListData.filter {
                        $0.title.lowercased().contains(lowercasedText)
                    }
                } else {
                    throw NavigationError.invalidSearch
                }
            } catch {
                router.navigate(to: ErrorWrapper(error: error, guidance: "Try a query with 10 chars at most."), preferredNavigationType: .sheet)
            }
        }
    }
}

#Preview {
    SearchResultView(searchText: .constant("econo"))
}
