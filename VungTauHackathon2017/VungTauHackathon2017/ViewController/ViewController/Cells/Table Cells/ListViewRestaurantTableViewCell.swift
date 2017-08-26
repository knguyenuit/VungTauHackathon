//
//  ListViewRestaurantTableViewCell.swift
//  hackAThon
//
//  Created by Vo Quang Huy on 8/26/17.
//  Copyright © 2017 Vo Quang Huy. All rights reserved.
//

import UIKit

class ListViewRestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var ivRestaurant: UIImageView!
    @IBOutlet weak var vGradient: UIView!
    
    var count = 0
    
    let color0 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0).cgColor
    let color1 = UIColor(red: 0/255, green: 216/255, blue: 216/255, alpha: 0.7).cgColor
    let color2 = UIColor(red: 251/255, green: 89/255, blue: 212/255, alpha: 0.7).cgColor
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    public func gradient(listColor : Array<CGColor>, listLocation: Array<NSNumber>, view : UIView) -> Void{
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = listColor
        gradientLayer.locations = listLocation
        view.layer.addSublayer(gradientLayer)
    }
    
    public func gradientView(index: Int) -> Void {
        if index % 2 == 0 {
            let listColorBlack: Array<CGColor> = [color1, color0]
            let listLocation: Array<NSNumber> = [0.0, 0.7]
            gradient(listColor: listColorBlack, listLocation: listLocation, view: vGradient)
                    } else {
            let listColorBlack: Array<CGColor> = [color2, color0]
            let listLocation: Array<NSNumber> = [0.0, 0.7]
            gradient(listColor: listColorBlack, listLocation: listLocation, view: vGradient)
            
        }
       
        
        
        
    }

    
}
