//
//  VisionAPIResponce.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

public struct VisionAPIResponce: Decodable {
    let responses: [APIResponce]
}

struct APIResponce: Decodable {
    let labelAnnotations: [LabelAnnotation]
}

struct LabelAnnotation: Decodable {
    let mid: String
    let description: String
    let score: Double
}
