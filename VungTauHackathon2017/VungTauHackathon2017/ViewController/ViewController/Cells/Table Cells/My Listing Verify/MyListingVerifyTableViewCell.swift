//
//  MyListingVerifyTableViewCell.swift
//  axcro
//
//  Created by Khanh Nguyen on 9/14/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class MyListingVerifyTableViewCell: UITableViewCell {

    @IBOutlet weak var lbMerchantStatus: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbVerificationCode: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ivAvatar.kf.indicatorType = .activity
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func validateData(merchant: Merchant) {
//        lbTitle.text = merchant.businessName ?? ""
//        let imageURL = merchant.file?.first?.smallURL ?? ""
//        if imageURL != "" {
//            var urlImage = URL(string: imageURL)
//            if let url = urlImage {
//                ivAvatar.setImage(url: url)
//            }
//            //ivAvatar.kf.setImage(with: urlImage)
//        } else {
//            ivAvatar.image = #imageLiteral(resourceName: "placeholder")
//        }
//        lbVerificationCode.text = merchant.redemtionCode ?? ""
//        if merchant.status == 1 {
//            let date = Helpers.covertStringToDate(date: merchant.createAt ?? "2017-09-09")
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM-yyyy"
//            let dateConvert = dateFormatter.string(from: date)
//        
//            lbMerchantStatus.text = "Verified Merchant - \(dateConvert)"
//        } else {
//            lbMerchantStatus.text = "Pending Verification"
//        }
//    }
    
}
