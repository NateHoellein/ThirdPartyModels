//
//  NoImageSelectedView.swift
//  ThirdPartyModels
//
//  Created by nate on 10/20/24.
//

import SwiftUI

struct NoImageSelectedView: View {
    var body: some View {
        Image(systemName: "photo.on.rectangle.angled")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .foregroundColor(.gray)
    }
}

#Preview {
    NoImageSelectedView()
}
