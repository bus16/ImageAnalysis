//
//  VisualAPI.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

final class VisionAPI: RequestHandler, VisionAPIService {
    
    static let shared = VisionAPI()
    let networkClient = NetworkClient()

    var task : URLSessionTask?
    
    func labelsDetect(_ data: String, completion: @escaping ((Result<[VisionParseResult], ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchCurrencies()
        
        task = networkClient.request(with: data, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchCurrencies() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
