//
//  NetworkClient.swift
//  FetchRecipeApp
//
//  Created by Roberto Cabrera on 1/7/25.
//

import Foundation


enum RecipeDataError: Error {
    case invalidData
    case emptyData
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

class NetworkClient {
    
    func getRecipes() async throws -> [Recipe] {

        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else{
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
            
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do{
            let recipes = try decoder.decode([String: [Recipe]].self, from: data)
            
            if(recipes.count == 0){
                throw RecipeDataError.emptyData
            }
            return recipes.values.first!
            
        }catch {
            throw RecipeDataError.invalidData
        }
        
    }
}
