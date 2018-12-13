//
//  UIImage.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import UIKit

extension UIImage {
    
    func resizeImage(_ imageSize: CGSize, image: UIImage) -> Data {
        defer { UIGraphicsEndImageContext() }
        
        UIGraphicsBeginImageContext(imageSize)
        image.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            let resizedImage = newImage.pngData()
            UIGraphicsEndImageContext()
            return resizedImage!
        } else {
            return Data()
        }
    }
    
    func base64EncodeImage() -> String {
        guard var imagedata = self.pngData() else { return "" }
        
        if imagedata.count > Constants.maxSizeImage {
            let oldSize: CGSize = self.size
            let height: Int = Int(Double(oldSize.height / oldSize.width) * Double(Constants.defaultImageWidth))
            let newSize: CGSize = CGSize(width: Constants.defaultImageWidth, height: height)
            imagedata = resizeImage(newSize, image: self)
        }
        return imagedata.base64EncodedString(options: .endLineWithCarriageReturn)
    }
}
