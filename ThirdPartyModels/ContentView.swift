//
//  ContentView.swift
//  ThirdPartyModels
//
//  Created by nate on 10/20/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedImage: PhotosPickerItem?
    @State private var image: Image?
    @State private var cgImage: CGImage?
    
    var body: some View {
        PhotosPicker("Select from Photos Library", selection: $selectedImage, matching: .images)
            .onChange(of: selectedImage) {
                Task {
                    if let loadedImageData = try? await selectedImage?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: loadedImageData) {
                        image = Image(uiImage: uiImage)
                        cgImage = uiImage.cgImage
                    }
                }
            }
        if let image = image {
            ImageDisplayView(image: image)
        } else {
            NoImageSelectedView()
        }
    }
}

#Preview {
    ContentView()
}
