//
//  CustomTableViewCell.swift
//  UITableController
//
//  Created by jerry on 16/9/9.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var RestaurantImage: UIImageView!

    @IBOutlet weak var RestaurantName: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var RestaurantType: UILabel!
    
    @IBOutlet weak var 女神: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
