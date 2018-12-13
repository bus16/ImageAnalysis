//
//  VisonAPIRequest.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

public struct VisonAPIRequest: Codable {
    let requests: APIRequest

    init(image: String, type: String, maxResult: Int) {
        requests = APIRequest(features: [APIFeatures(type: type, maxResults: maxResult)], image: ImageContent(content: image))
    }
}

struct APIRequest: Codable {
    let features: [APIFeatures]
    let image: ImageContent
}

struct  ImageContent: Codable {
    let content: String
}

struct APIFeatures: Codable {
    let type: String
    let maxResults: Int
}
