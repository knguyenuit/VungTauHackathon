//
//  ListViewTableViewCell.swift
//  APPETITE
//
//  Created by Vo Quang Huy on 8/4/17.
//  Copyright © 2017 Vo Quang Huy. All rights reserved.
//

import UIKit

class ListHotelTableViewCell: UITableViewCell {

    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func poplulateDate(avatarName: String, name: String, address: String) {
        ivAvatar.image = UIImage(named: avatarName)
        lbName.text = name
        lbAddress.text = address
    }
    
}
