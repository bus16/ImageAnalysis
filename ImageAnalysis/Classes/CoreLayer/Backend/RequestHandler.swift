//
//  RequestHandler.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

class RequestHandler {
    
    func networkResult<T: Parceable>(completion: @escaping ((Result<[T], ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            
            return { result in
                
                DispatchQueue.global(qos: .background).async(execute: {
                    switch result {
                    case .success(let data) :
                        ParserHelper.parse(data: data, completion: completion)
                        break
                    case .failure(let error) :
                        completion(.failure(.network(string: error.localizedDescription)))
                        break
                    }
                })
            }
    }
}
