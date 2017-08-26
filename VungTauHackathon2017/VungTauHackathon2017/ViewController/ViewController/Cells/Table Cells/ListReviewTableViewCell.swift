//
//  ListReviewTableViewCell.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import Cosmos
class ListReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var lbContent: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(userName: String, content: String) {
        lbName.text = userName
        lbContent.text = content
    }
    
}
