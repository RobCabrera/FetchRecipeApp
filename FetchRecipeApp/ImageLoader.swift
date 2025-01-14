//
//  ImageLoader.swift
//  FetchRecipeApp
//
//  Created by Roberto Cabrera on 1/9/25.
//

import Foundation
import UIKit


@MainActor
class ImageLoader: ObservableObject {
    
    @Published var imageFromURL: UIImage?
    
    //cache
    private static let cache = NSCache<NSString, UIImage>()
    
    func getImage(url: URL?) async throws {
        guard let url = url else{
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString) {
            imageFromURL = cachedImage
        }else{
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            guard let image = UIImage(data: data) else {
                throw NetworkError.invalidData
            }
            
            Self.cache.setObject(image, forKey: url.absoluteString as NSString)
            
            imageFromURL = image
        }
        
        
    }
}
