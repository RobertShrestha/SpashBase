//
//  ListTableViewCell.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//  Copyright © 2019 robert. All rights reserved.
//

import UIKit
import Kingfisher

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbNailView:UIImageView!
    @IBOutlet weak var nameLblTxt:UILabel!
    @IBOutlet weak var playIcon:UIImageView!
    
    
    func setupCell(image:ListModel){
        thumbNailView.kf.setImage(with:URL(string: image.url))
        nameLblTxt.text = image.url.fileName()
        if image.largeURL.isMp4URL{
            self.playIcon.isHidden = false
        }else{
            self.playIcon.isHidden = true
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
