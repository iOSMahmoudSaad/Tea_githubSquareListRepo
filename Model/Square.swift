//
//  Square.swift
//  Tea_githubSquareListRepo
//
//  Created by Mahmoud Saad on 15/06/2023.
//

import Foundation

struct Square : Codable {
    
    let squareName : String?
    let squareDescription : String?
    
    enum CodingKeys: String, CodingKey {
        case squareName = "name"
        case squareDescription = "description"
    }
    
    
}
