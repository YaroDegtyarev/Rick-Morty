//
//  Person.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 18.11.2023.
//

import Foundation

struct PersonResults: Decodable {
    let results: [Person]
    
    struct Person: Decodable {
        var name: String
        var status: String
        var gender: String
        var image: String
              
    }
}
