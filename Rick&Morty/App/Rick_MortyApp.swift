//
//  Rick_MortyApp.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 17.11.2023.
//

import SwiftUI


@main
struct Rick_MortyApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
            
        }
    }
}
