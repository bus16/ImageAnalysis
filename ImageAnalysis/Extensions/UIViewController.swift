//
//  UIViewController.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlert(title: String?, message: String, needConfirm: Bool? = true) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            if needConfirm == true {
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.present(alert, animated: true, completion: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                        alert.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
}
