//
//  ImagePickerView.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import UIKit

extension ImageAnalysisViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[.originalImage] as? UIImage else {
            self.showErrorAlert(title: Constants.error, message: Constants.errorLoadImage)
            dismiss(animated: true, completion: nil)
            return 
        }
        
        self.selectedImage.image = pickedImage
        self.tapInfoLabel.isHidden = true
        networkActivity.startAnimating()
        let binaryImageData = pickedImage.base64EncodeImage()
        self.viewModel.sendImageData(data: binaryImageData, { message in
            DispatchQueue.main.async {
                self.networkActivity.stopAnimating()
            }
        })
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
