//
//  MyListingTableViewCell.swift
//  axcro
//
//  Created by Khanh Nguyen on 9/14/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import Kingfisher


class MyListingTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbValidPeriod: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbTotalPrice: UILabel!
    @IBOutlet weak var lbSession: UILabel!
    @IBOutlet weak var lbListedAt: UILabel!
    
    var listing : Listings?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.allowsButtonsWithDifferentWidth = true
        //ivAvatar.kf.indicatorType = .activity
        
    }

    
    func populateData(listing: Listings) {
        self.listing = listing
        //setup(imageURL: listing.file.first?.mediumURL ?? "", title: listing.title, totalPrice: String(listing.totalPrice), validPeriod: String(listing.validPeriod), session: String(listing.noSessions), dateListed: listing.createdAt)
    }
    
    func setup(imageURL: String?, title: String?, totalPrice: String?, validPeriod: String?, session: String?, dateListed: String?) {
//        if imageURL != "" {
//            var urlImage = URL(string: imageURL!)
//            if let url = urlImage {
//                ivAvatar.setImage(url: url)
//            }
//            //ivAvatar.kf.setImage(with: urlImage)
//        } else {
//            ivAvatar.image = #imageLiteral(resourceName: "bgMyListing")
//        }
        ivAvatar.image = #imageLiteral(resourceName: "Restaurant")
        lbTitle.text = title ?? ""
        lbTotalPrice.text = "$\(totalPrice ?? "")"
        lbValidPeriod.text = "\(validPeriod ?? "") months"
        lbSession.text = "\(session ?? "") sessions"
//        let date = Helpers.covertStringToDate(date: dateListed ?? "2017-09-01")
//            let year = Calendar.current.component(.year, from: date)
//            let month = Helpers.convertNumberToShortMonth(num: Calendar.current.component(.month, from: date))
//        let day = Calendar.current.component(.day, from: date)
//        lbListedAt.text = "Listed on \(day) \(month) \(year)"
    }
}

