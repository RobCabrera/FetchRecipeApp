//
//  RecipeDetailView.swift
//  FetchRecipeApp
//
//  Created by Roberto Cabrera on 1/7/25.
//

import SwiftUI

struct RecipeDetailView : View{
    
    let recipe: Recipe
    
    var body: some View {
//        ScrollView {
//            VStack (alignment: .leading) {
//                Text(recipe.name).font(.headline)
//            }
//        }
       // NavigationStack {
            ZStack {
                AsyncImage(
                    url: URL(string: recipe.photoUrlLarge),
                    content:  { image in
                        image.resizable().aspectRatio(contentMode: .fill).ignoresSafeArea(.all).blur(radius: 5) //.frame(maxWidth: 250, maxHeight: 250)
                    }, placeholder: {
                        ProgressView()
                    })
                
                ZStack(alignment: .center) {
                    VStack (alignment: .center) {
                        Text(recipe.name).font(.headline).fontWeight(.bold).foregroundStyle(.white)
                        Text(recipe.cuisine).font(.subheadline).foregroundStyle(.white)
                    }
                }
                
                    
               
            }
        //}.tint(Color.white)

    }
}
