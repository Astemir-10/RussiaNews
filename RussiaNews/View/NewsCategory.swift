//
//  NewsCategory.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 27.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class NewsCategory: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var viewFromCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        viewFromCell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        clipsToBounds = true
        
    }

}
