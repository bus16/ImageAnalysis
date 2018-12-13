//
//  LabelsTableViewDelegate.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import UIKit

extension ImageAnalysisViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        
        if self.dataSource.data.value.count > 0 {
            let leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 28))
            leftLabel.center = CGPoint(x: 55, y: 14)
            leftLabel.textAlignment = NSTextAlignment.left
            leftLabel.font = UIFont(name: "Helvetica-Light", size: 20.0)
            leftLabel.text = "LABELS"
            header.addSubview(leftLabel)
            
            let rightLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 28))
            rightLabel.center = CGPoint(x: tableView.frame.width - 55, y: 14)
            rightLabel.textAlignment = NSTextAlignment.right
            rightLabel.font = UIFont(name: "Helvetica-Light", size: 20.0)
            rightLabel.text = "SCORES"
            header.addSubview(rightLabel)
        }
        
        header.backgroundColor = UIColor.white
        
        return header
    }
}
