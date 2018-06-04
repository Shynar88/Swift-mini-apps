//
//  MyCustomTableViewCell.swift
//  ToDoList
//
//  Created by Шынар Торехан on 04/07/2017.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTextLabel: UILabel!
    @IBOutlet weak var myDetailTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    
//    override func layoutSubviews() {
//        myImageView.clipsToBounds = true
//        myImageView.layer.cornerRadius = 37.5
//    }
}



