//
//  OverlayView.swift
//  ThirdPartyModels
//
//  Created by nate on 10/20/24.
//

import SwiftUI
import Vision

struct OverlayView: View {
    var object: DetectedObject
    var lineColor: Color = .red
    
    var body: some View {
        GeometryReader { proxy in
            let adjustedRect = VNImageRectForNormalizedRect(
                object.boundingBox,
                Int(proxy.size.width),
                Int(proxy.size.height)
            )
            
            let xa1 = adjustedRect.origin.x
            let ya1 = proxy.size.height - adjustedRect.origin.y
            let xa2 = adjustedRect.origin.x + adjustedRect.width
            let ya2 = proxy.size.height - (adjustedRect.origin.y + adjustedRect.height)
            
            Path { path in
                path.move(to: CGPoint(x: xa1, y: ya1))
                path.addLine(to: CGPoint(x: xa1, y: ya2))
                path.addLine(to: CGPoint(x: xa2, y: ya2))
                path.addLine(to: CGPoint(x: xa2, y: ya1))
                path.closeSubpath()
            }
            .stroke(lineColor, lineWidth: 2.0)
            let textX = min(xa1, xa2)
            let textY = min(ya1, ya2)
            Text(object.label)
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 4.0))
                .offset(x: textX, y: textY)
                .padding(2.0)
        }
    }
}

#Preview {
    let object = DetectedObject(
        label: "LABEL",
        confidence: 0.9,
        boundingBox: CGRect(
            x: 0.1,
            y: 0.2,
            width: 0.3,
            height: 0.4
        )
    )
    OverlayView(object: object)
}
