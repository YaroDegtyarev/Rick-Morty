//
//  MainView.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 17.11.2023.
//

import SwiftUI

struct PersonListView: View {
    
   @StateObject var networkModel = NetworkModel()
   
    var body: some View {
        NavigationStack {
            VStack {
                List(networkModel.persons) { person in
                    NavigationLink {
                        EpisodesView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack {
                            AsyncImage(url: person.image) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    .cornerRadius(10)
                            } placeholder: {
                                Text("Loading...")
                            }
                            VStack(alignment: .leading) {
                                Text("Name: \(person.name)")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                Text("Gender: \(person.gender)")
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                                Text("Status: \(person.status)")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    }
                    
                   
                    .task {
                    do {
                        try await networkModel.fetchPersons()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
    
struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}
