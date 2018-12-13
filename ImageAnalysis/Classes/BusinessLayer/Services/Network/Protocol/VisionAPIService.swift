//
//  VisionAPIService.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

protocol VisionAPIService {
    func labelsDetect(_ data: String, completion: @escaping ((Result<[VisionParseResult], ErrorResult>) -> Void))
}
