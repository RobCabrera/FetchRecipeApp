//
//  RecipeList.swift
//  FetchRecipeApp
//
//  Created by Roberto Cabrera on 1/7/25.
//

import SwiftUI

struct RecipeList: View {
    
    @StateObject var viewModel = RecipeListViewModel()
    
    var body: some View {
        List {
            switch viewModel.state {
            case .initial:
                ProgressView().progressViewStyle(.circular).frame(maxWidth: .infinity)
            case let .recipe(recipes):
                recipeRows(recipes)
            case .error(let string):
                Text(string)
            case .recipeListEmpty:
                emptyList()
            }
        }
        .navigationTitle("Recipes")
        .task{
            await viewModel.fetchRecipes()
        }
        .refreshable {
            await viewModel.fetchRecipes()
        }
    }
    
    func recipeRows(_ recipes: [Recipe]) -> some View {
            ForEach(recipes) { recipe in
                    ZStack(alignment: .leading){
                        
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                            EmptyView()
                        }.opacity(0)
                        RecipeListItemView(id: recipe.id, name: recipe.name, cuisine: recipe.cuisine, photoUrlLarge: recipe.photoUrlLarge, photoUrlSmall: recipe.photoUrlLarge , recipeSourceURL: String(recipe.recipeSourceURL ?? ""), recipeYouTubeURL: String(recipe.recipeYouTubeURL ?? ""))
                            .listRowInsets(EdgeInsets())
                        Spacer()
                            .listRowBackground(Color.clear)
                    }
                    .cornerRadius(15)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                
   
        }
    
    
    func emptyList() -> some View{
        ZStack(alignment: .leading) {
            Text("No recipes available at this time.")
        }
    }
}
