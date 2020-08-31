//
//  ContactsCellTableViewCell.swift
//  sample_project
//
//  Created by Kelsey Lieberman on 8/27/20.
//  Copyright © 2020 Kelsey Lieberman. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {

    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
