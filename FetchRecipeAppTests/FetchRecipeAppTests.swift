//
//  FetchRecipeAppTests.swift
//  FetchRecipeAppTests
//
//  Created by Roberto Cabrera on 1/10/25.
//

import XCTest
@testable import FetchRecipeApp

final class FetchRecipeAppTests: XCTestCase {
    
    func testSucessRecipesDataFetch() async throws {
        
        let fetch = try await NetworkClient().getRecipes()
        XCTAssertNoThrow(fetch)
    }
    
    func testRecipesMalformedDataFetch() async throws {
        do{
            try await NetworkClient().getRecipes()
        }catch{
            switch error {
            case RecipeDataError.invalidData:
                XCTAssertTrue(true)
            default:
                XCTAssertTrue(false)
            }
        }
    }

    func testRecipesDataNotEmpty() async throws {
        let fetch = try await NetworkClient().getRecipes()
        XCTAssertGreaterThan(fetch.count, 1)
    }
    
    

    
}
