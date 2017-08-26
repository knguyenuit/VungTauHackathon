//
//  SellectTableViewCell.swift
//  hackAThon
//
//  Created by Vo Quang Huy on 8/26/17.
//  Copyright © 2017 Vo Quang Huy. All rights reserved.
//

import UIKit

class SellectTableViewCell: UITableViewCell {

    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var lblNameOption: UILabel!
    @IBOutlet weak var vGradient: UIView!
    @IBOutlet weak var lblDetailNameOption: UILabel!
    
    let color0 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0).cgColor
    //let color1 = UIColor(red: 0/255, green: 216/255, blue: 216/255, alpha: 0.7).cgColor
    let color1 = UIColor(red: 118/255, green: 95/255, blue: 189/255, alpha: 0.7).cgColor
    let startP = CGPoint(x: 0.0, y: 0.5)
    let endP = CGPoint(x: 1.0, y: 0.5)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(index: Int) {
        switch index {
        case 0:
            ivBackground.image = UIImage(named: "Hotel")
            lblNameOption.text = "Hotel"
            gradientView(startPoint: startP, endPoint: endP)
            break
        case 1:
            ivBackground.image = UIImage(named: "Restaurant")
            lblNameOption.text = "Restaurant"
            lblNameOption.textAlignment = .right
            lblDetailNameOption.textAlignment = .right
            gradientView(startPoint: endP, endPoint: startP)
            break
        case 2:
            ivBackground.image = UIImage(named: "Even")
            lblNameOption.text = "Event"
            gradientView(startPoint: startP, endPoint: endP)
            break
        case 3:
            ivBackground.image = UIImage(named: "Site")
            lblNameOption.text = "Site"
            lblNameOption.textAlignment = .right
            lblDetailNameOption.textAlignment = .right
            gradientView(startPoint: endP, endPoint: startP)
            break
        case 4:
            ivBackground.image = UIImage(named: "Mysteri Shoper")
            lblNameOption.text = "Mystery Shopper"
            gradientView(startPoint: startP, endPoint: endP)
            break
        default:
            break
        }
    }
    
    public func gradient(listColor : Array<CGColor>, listLocation: Array<NSNumber>, view : UIView, startPoint: CGPoint, endPoint: CGPoint) -> Void{
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = listColor
        gradientLayer.locations = listLocation
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        view.layer.addSublayer(gradientLayer)
    }
    
    public func gradientView(startPoint: CGPoint, endPoint: CGPoint) -> Void {
//        if index % 2 == 0 {
//            let listColorBlack: Array<CGColor> = [color1, color0]
//            let listLocation: Array<NSNumber> = [0.0, 0.7]
//            gradient(listColor: listColorBlack, listLocation: listLocation, view: vGradient)
//        } else {
//            let listColorBlack: Array<CGColor> = [color2, color0]
//            let listLocation: Array<NSNumber> = [0.0, 0.7]
//            gradient(listColor: listColorBlack, listLocation: listLocation, view: vGradient)
//            
//        }

        let listColorBlack: Array<CGColor> = [color1, color0]
        let listLocation: Array<NSNumber> = [0.0, 0.7]
        gradient(listColor: listColorBlack, listLocation: listLocation, view: vGradient, startPoint:  startPoint, endPoint: endPoint)
}
}
