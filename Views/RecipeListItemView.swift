//
//  RecipeListItemView.swift
//  FetchRecipeApp
//
//  Created by Roberto Cabrera on 1/7/25.
//

import SwiftUI

struct RecipeListItemView: View{
    var id: String
    var name: String
    var cuisine: String
    var photoUrlLarge: String
    var photoUrlSmall: String
    var recipeSourceURL: String
    var recipeYouTubeURL: String
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ImageView(url: URL(string: photoUrlSmall))
            HStack{
                VStack(alignment: .leading){
                    Text(name).font(.headline).foregroundStyle(.white)
                    Text("Cuisine: " + cuisine).font(.subheadline).foregroundColor(Color.white)
                        
                }
                Spacer()
            }
            .padding()
            .background(Color.black.opacity(0.75))
            .foregroundColor(.primary)
        }
        .cornerRadius(15)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)

    }
}
