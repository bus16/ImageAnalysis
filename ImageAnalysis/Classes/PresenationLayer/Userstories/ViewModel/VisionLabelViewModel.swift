//
//  VisionLabelViewModel.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation


struct VisionLabelViewModel {
    
    weak var dataSource : GenericDataSource<VisionParseResult>?
    weak var service: VisionAPI?
    
    init(service: VisionAPI = VisionAPI.shared, dataSource : GenericDataSource<VisionParseResult>?) {
        self.service = service
        self.dataSource = dataSource
    }
    
    func sendImageData(data: String, _ completion: ((String?) -> Void)? = nil) {
        
        guard let service = service else {
            completion?("Missing service")
            return
        }
        
        service.labelsDetect(data) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let convertedResponce) :
                    // reload data
                    self.dataSource?.data.value = convertedResponce
                    completion?(nil)
                    break
                case .failure(let error) :
                    self.dataSource?.data.value.removeAll()
                    completion?(error.localizedDescription)
                    break
                }
            }
        }
    }
}
