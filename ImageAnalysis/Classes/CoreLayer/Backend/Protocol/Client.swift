//
//  Client.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

protocol Client {
    func request(with imageBase64: String, completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask?
}
