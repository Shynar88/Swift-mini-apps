//
//  FoodTableViewCell.swift
//  megaApp
//
//  Created by Шынар Торехан on 04/07/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyDescriptionLabel: UILabel!
    @IBOutlet weak var companyAverageReceiptLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        logoImageView.clipsToBounds = true
        logoImageView.layer.cornerRadius = 37.5
    }

}
