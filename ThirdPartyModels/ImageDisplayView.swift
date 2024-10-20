//
//  ImageDisplayView.swift
//  ThirdPartyModels
//
//  Created by nate on 10/20/24.
//

import SwiftUI

public struct ImageDisplayView: View {
    var image: Image
    
    public var body: some View {
        image
            .resizable()
            .scaledToFit()
            .padding(5.0)
            .border(Color.primary)
            .padding(5.0)
    }
}
