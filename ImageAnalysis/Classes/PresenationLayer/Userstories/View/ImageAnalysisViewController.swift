//
//  ImageAnalysisViewController.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import UIKit

class ImageAnalysisViewController: UIViewController {

    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var networkActivity: UIActivityIndicatorView!
    @IBOutlet weak var tapInfoLabel: UILabel!
    @IBOutlet weak var tableView : UITableView!
    
    let dataSource = LabelsTableDataSource()
    var networkIsAvailable = true
    
    lazy var viewModel : VisionLabelViewModel = {
        let viewModel = VisionLabelViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self.dataSource
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        imagePicker.delegate = self
        networkActivity.hidesWhenStopped = true
        
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
        
        let tapRec = UITapGestureRecognizer(target: self, action: #selector(loadImage))
        selectedImage.isUserInteractionEnabled = true
        selectedImage.addGestureRecognizer(tapRec)
        
        let date = Date().addingTimeInterval(1)
        let timer = Timer(fireAt: date, interval: 1, target: self, selector: #selector(checkReacheabilityOfNetwork), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }

    @objc func loadImage() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .savedPhotosAlbum
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func checkReacheabilityOfNetwork() {
        guard let reachability = Reachability() else { return }
        
        if !reachability.isReachable, networkIsAvailable == true {
            networkIsAvailable = false
            self.showErrorAlert(title: "Failure", message: "Network is unreachability", needConfirm: false)
        } else if reachability.isReachable, networkIsAvailable == false {
            networkIsAvailable = true
            self.showErrorAlert(title: "", message: "The network is available again", needConfirm: false)
        }
    }
}
