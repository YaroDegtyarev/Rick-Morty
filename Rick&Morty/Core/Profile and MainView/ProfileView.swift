//
//  ProfileView.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 17.11.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
       
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                       Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                          Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section("Account") {
                    Button {
                       viewModel.signOut()
                        
                        print("Sign out")
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill",
                                        title: "Sign Out",
                                        tintColor: .red)
                    }
/*                    Button {
                        print("Delete Account")
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill",
                                        title: "Delete Account",
                                        tintColor: .red)
                    } */
                }
                
            }
        }
           
    }
        
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

