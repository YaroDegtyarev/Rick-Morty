//
//  MainView.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 17.11.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("You are in!")
        }
        .onAppear {
            NetworkServiceWithCompletions.shared.fetchData { result in
                switch result {
                case .success(let personsData):
                    print("Data: \(personsData.results[1].name)")
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
