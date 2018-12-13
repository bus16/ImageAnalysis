//
//  LabelsTableViewDataSource.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class LabelsTableDataSource: GenericDataSource<VisionParseResult>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numItems = data.value.count
        
        if numItems == 0 {
            tableView.separatorStyle = .none
            return 1
        } else {
            tableView.separatorStyle = .singleLine
            return numItems
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numItems = data.value.count
        
        if numItems > 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.resultCellIdentifer, for: indexPath) as? ResultCell {
                cell.configure(context: self.data.value[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.emptyCellIdentifer, for: indexPath)
            return cell
        }
    }
}
