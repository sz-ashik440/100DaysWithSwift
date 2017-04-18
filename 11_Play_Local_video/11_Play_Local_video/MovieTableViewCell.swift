//
//  MovieTableViewCell.swift
//  11_Play_Local_video
//
//  Created by Admin on 4/18/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

struct Movie {
    var title: String
    var imageSource: String
    var videoSource: String
}

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
