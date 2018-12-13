//
//  TableViewProviding.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import Foundation

protocol TableViewProviding {
    func hideTableView()
    func showTableView()
    func updateDataSource(data: [(String, String)])
}
