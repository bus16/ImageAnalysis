//
//  TableViewData.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

protocol TableViewData {
    var inputData: [(String, String)] { set get }
    func getDataSource() -> [(String, String)]
}
