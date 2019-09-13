//
//  CountryTableViewCell.swift
//  CountryOnOff
//
//  Created by Peter Gits on 9/11/19.
//  Copyright © 2019 GeekGaps. All rights reserved.
//

import UIKit
import SwipeCellKit

class CountryTableViewCell: SwipeTableViewCell {
    
    @IBOutlet weak var flagImgView: UIImageView!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

