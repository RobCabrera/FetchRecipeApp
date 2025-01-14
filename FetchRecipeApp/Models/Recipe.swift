//
//  Recipe.swift
//  FetchRecipeApp
//
//  Created by Roberto Cabrera on 1/7/25.
//

import Foundation

struct Recipe: Codable, Identifiable, Equatable {
    
    var uuid: String
    var name: String
    var cuisine: String
    var photoUrlLarge: String
    var photoUrlSmall: String
    var recipeSourceURL: String?
    var recipeYouTubeURL: String?
    
    var id: String { uuid }
}

//struct Recipes : Codable {
//    let recipes: [Recipe]
//}

extension Recipe{
    static let mock = Recipe(uuid: "1", name: "Bollo de Pescado SUPER FÁCIL | KWA", cuisine: "Ecuadorian", photoUrlLarge: "https://i.ytimg.com/vi/0eyjo-igI54/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLBfW6mdS5jmJ8_H9JEqtQA2T6Q-Uw", photoUrlSmall: "Mock", recipeSourceURL: "https://recetaskwa.com/2023/09/19/bollo-de-pescad/", recipeYouTubeURL: "https://www.youtube.com/watch?v=0eyjo-igI54");
}
