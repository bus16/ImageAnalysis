//
//  Converter.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

extension VisionParseResult: Parceable {
    
    static func parseObject(data: VisionAPIResponce) -> Result<[VisionParseResult], ErrorResult> {
        let conversion = data.responses.flatMap{ $0.labelAnnotations.map{ VisionParseResult(labels: $0.description, score: $0.score) }}
        return .success(conversion)
    }
}
