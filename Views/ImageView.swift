//
//  ImageView.swift
//  FetchRecipeApp
//
//  Created by Roberto Cabrera on 1/9/25.
//

import Foundation
import SwiftUI

struct ImageView: View {
    
    let url: URL?
    
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        VStack{
            if let imageFromURL = imageLoader.imageFromURL{
                Image(uiImage: imageFromURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }else{
                ProgressView()
            }
        }.task {
            await downloadImage()
        }
    }
    
    
    private func downloadImage() async {
        do{
            try await imageLoader.getImage(url: url)
        }catch{
            print(error)
        }
    }
}
