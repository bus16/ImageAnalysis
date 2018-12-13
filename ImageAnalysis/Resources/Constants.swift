//
//  Constants.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

public struct Constants {
    static let googleAPIKey = "YOUR_KEY"

    static let googleURL = "https://vision.googleapis.com/v1/images:annotate?key=\(googleAPIKey)"

    static let resultCellIdentifer = "ResultCell"
    static let emptyCellIdentifer = "NoDataCell"

    static let maxSizeImage = 2097152

    static let defaultImageWidth = 800
    
    static let error = "Error"
    static let errorLoadImage = "Expected a image"
}
