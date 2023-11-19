//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 17.11.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

  
    var body: some View {
        Group {
            if viewModel.validatePassword == true {
                TabBarView()
            } else if viewModel.successSignUp == true {
                LoginView()
            } else {
                LoginView()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
