//
//  Person.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 18.11.2023.
//

import Foundation

struct Person: Decodable{
    let results: [PersonResults]
    
    struct PersonResults: Decodable,CustomStringConvertible,Identifiable  {
        let id: Int
        let name: String
        let status: String
        let gender: String
        let image: URL
        
        var description: String {
            return "person with name: \(name) and gender \(gender), status \(status)"
        }
            
        enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case gender
        case image
        }
            
           
    }
}

