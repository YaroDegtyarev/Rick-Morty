//
//  NetWorkModel.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 19.11.2023.
//

import Foundation

@MainActor
class NetworkModel: ObservableObject {
    
    @Published var persons: [Person.PersonResults] = []
    
    func fetchPersons() async throws {
        
        var request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character")!)
        let (data, _) = try await URLSession.shared.data(for: request)
        let personResponse = try JSONDecoder().decode(Person.self, from: data)
        persons = personResponse.results
    }
    
}
