//
//  MyPurchasesTableViewCell.swift
//  axcro
//
//  Created by Vo Quang Huy on 9/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class MyPurchasesTableViewCell: UITableViewCell {

    @IBOutlet weak var ivMyPurchases: UIImageView!
    @IBOutlet weak var lblNumerOfPurchases: UILabel!
    @IBOutlet weak var lblPurchases: UILabel!
    @IBOutlet weak var lblDateStart: UILabel!
    @IBOutlet weak var lblNameListing: UILabel!
    @IBOutlet weak var lblMerchant: UILabel!
    @IBOutlet weak var lblDateExpires: UILabel!
    @IBOutlet weak var vPurchases: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpView()
        //ivMyPurchases.kf.indicatorType = .activity
    }
    
    func setUpView() {
        ShadowView.init(view: vPurchases)
    }
    
//    func populateData (listPurchases: APIGetListPurchases) {
//        self.listPurchases = listPurchases
//        lblNameListing.text = self.listPurchases?.listing?.title
//        if let url = URL(string: (listPurchases.listing?.file.first?.mediumThumbFileURL)!) {
//            ivMyPurchases.setImage(url: url)
//        }
//        //ivMyPurchases.kf.setImage(with: url)
//        lblMerchant.text = self.listPurchases?.listing?.merchants?.businessName
//
//        let noRedem = listPurchases.noRedeemed
//        let noSession = listPurchases.listing?.noSessions ?? 0
//        let sessionLeft = noSession - noRedem
//
//        lblNumerOfPurchases.text = "\(sessionLeft)"
//        lblDateStart.text = "Puchased on \(Helpers.convertDateToShortDate(date: listPurchases.purchasedDate ?? "2017-09-09"))"
//        lblDateExpires.text = "Expires on \(Helpers.convertDateToShortDate(date: listPurchases.expiredDate ?? "2017-09-09"))"
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
