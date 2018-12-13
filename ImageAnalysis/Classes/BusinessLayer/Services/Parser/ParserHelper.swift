//
//  ParserHelper.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

protocol Parceable {
    static func parseObject(data: VisionAPIResponce) -> Result<[Self], ErrorResult>
}

final class ParserHelper {
    
    static func parse<T: Parceable>(data: Data, completion : (Result<[T], ErrorResult>) -> Void) {
        
        do {
            
            if let parseData = try? JSONDecoder().decode(VisionAPIResponce.self, from: data) {
                
                // init final result
                // check foreach dictionary if parseable
                switch T.parseObject(data: parseData) {
                case .failure(let error):
                    completion(.failure(.parser(string: error.localizedDescription)))
                    break
                case .success(let newModel):
                    completion(.success(newModel))
                    break
                }
            } else {
                // not an array
                completion(.failure(.parser(string: "Json data is not an array")))
            }
        } catch {
            // can't parse json
            completion(.failure(.parser(string: "Error while parsing json data")))
        }
    }
}
