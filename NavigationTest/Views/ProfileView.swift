//
//  ProfileView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 7/7/24.
//

import SwiftUI

struct ProfileView: View {
    var user: UserViewModel
    
    var body: some View {
        VStack {
            ProfileImageView(user: user)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.mint, lineWidth: 4))
                .padding(.top, 20)
            
            Text("\(user.firstName) \(user.lastName)")
                .font(.title)
                .padding(.top, 8)
            
            Text(user.address)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 4)
            
            Text("Edad: \(user.age)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 2)
            
            Spacer()
        }
        .navigationBarTitle("Perfil del Usuario", displayMode: .inline)
        .padding()
    }
}

struct ProfileImageView: View {
    var user: UserViewModel
    
    var body: some View {
        if let url = user.profilePictureURL {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.mint)
                        .frame(width: 64, height: 64)
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            ZStack {
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(
                            colors: [Color.green, Color.mint]),
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        )
                    )
                    .frame(width: 120, height: 120)

                Text(String(user.firstName.prefix(1)) + String(user.lastName.prefix(1)))
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview("Regular") {
    ProfileView(user: userRichieData)
}
#Preview("No Avatar") {
    ProfileView(user: userRichieNoAvatarData)
}
