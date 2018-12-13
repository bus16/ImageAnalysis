//
//  ResultCell.swift
//  ImageAnalysis
//
//  Created by Nikolay Kulikov on 12.12.2018.
//  Copyright © 2018 Николай Куликов. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    
    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var score: UILabel!

    func configure(context: VisionParseResult) {
        labels.text = context.labels
        score.text = String(format: "%.4f", context.score)
    }
}
