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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countViewer: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var saveFlag = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentCellView.clipsToBounds = true
        contentCellView.layer.cornerRadius = 15
        saveButton.setImage(#imageLiteral(resourceName: "bookmark"), for: .normal)
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        saveButton.willMove(toSuperview: self)
        // Configure the view for the selected state
    }

}
