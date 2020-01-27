//
//  NewsCell.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 24.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var contentCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentCellView.clipsToBounds = true
        contentCellView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
