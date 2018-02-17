//
//  CustomTableViewCell.swift
//  SmartTagID
//
//  Created by Alex Johnson on 17/02/2018.
//  Copyright © 2018 Alex Johnson. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var dateStamp: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
