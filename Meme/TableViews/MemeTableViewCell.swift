//
//  MemeTableViewCell.swift
//  Meme
//
//  Created by Mohamed Mohsen on 4/28/19.
//  Copyright © 2019 Mohamed Mohsen. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {

    @IBOutlet weak var memedImage: UIImageView!
    @IBOutlet weak var memedDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
