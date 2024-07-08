//
//  SearchView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 6/7/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        SearchResultView(searchText: $searchText)
            .searchable(text: $searchText)
    }
}

#Preview {
    SearchView()
}
