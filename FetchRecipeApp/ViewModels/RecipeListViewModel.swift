//
//  RecipeListViewModel.swift
//  FetchRecipeApp
//
//  Created by Roberto Cabrera on 1/7/25.
//

import Foundation
import SwiftUI

@MainActor
final class RecipeListViewModel: ObservableObject {
    
    enum State: Equatable {
        case initial
        case recipeListEmpty
        case recipe([Recipe])
        case error(String)
    }
    
    @Published var state: State = .initial
    
    func fetchRecipes() async {
        do{
            let recipes = try await NetworkClient().getRecipes()
            withAnimation {
                if recipes.count > 0 {
                    state = .recipe(recipes)
                }else{
                    state = .recipeListEmpty
                }
            }
        }catch{
            withAnimation {
                print(error)
                state = .error(error.localizedDescription)
                switch error {
                case NetworkError.invalidData:
                    state = .error("Oops! Something went wrong. Please try again later.")
                case NetworkError.invalidResponse:
                    state = .error("Oops! Something went wrong. Please try again later.")
                case RecipeDataError.invalidData:
                    state = .error("The Recipes App is not available at this time. Please try again later.")
                case RecipeDataError.emptyData:
                    state = .error("No recipes found at this time. Please try again later.")
                default:
                    state = .error("Oops! Something went wrong. Please try again later.")
                }
            }
        }
    }
}
