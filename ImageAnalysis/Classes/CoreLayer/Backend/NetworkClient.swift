//
//  NetworkClient.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

final class NetworkClient: Client {
    let session = URLSession.shared
    
    func request(with imageBase64: String, completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        // Create our request URL
        guard let reachability = Reachability(), reachability.isReachable else {
            completion(.failure(.network(string: "Network is unreachability")))
            return nil
        }
        
        var request = URLRequest(url: URL(string: Constants.googleURL)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "X-Ios-Bundle-Identifier")
        
        // Build our API request
        let jsonRequest = VisonAPIRequest(image: imageBase64, type: "LABEL_DETECTION", maxResult: 100)
        
        // Serialize the JSON
        guard let data = try? JSONEncoder().encode(jsonRequest) else {
            completion(.failure(.network(string: "Wrong JSON format")))
            return nil
        }
        
        request.httpBody = data
    
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
                return
            }
    
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }
}
