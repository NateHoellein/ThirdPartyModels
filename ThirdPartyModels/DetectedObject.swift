//
//  DetectedObject.swift
//  ThirdPartyModels
//
//  Created by nate on 10/20/24.
//

import Foundation

struct DetectedObject {
    var label: String
    var confidence: Float
    var boundingBox: CGRect
}
