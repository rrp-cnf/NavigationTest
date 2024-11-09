//
//  ErrorView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 9/11/24.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper

    var body: some View {
        VStack {
            Text("An error has occurred!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
            Text(errorWrapper.guidance)
                .font(.caption)
                .padding(.top)
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}

#Preview {
    enum SampleError: Error {
        case errorRequired
    }

    return ErrorView(errorWrapper: ErrorWrapper(
        error: SampleError.errorRequired,
        guidance: "You can safely ignore this error."))
}
