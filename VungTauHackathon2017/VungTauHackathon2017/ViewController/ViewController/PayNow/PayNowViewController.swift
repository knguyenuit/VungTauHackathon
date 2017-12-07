//
//  PayNowViewController.swift
//  VungTauHackathon2017
//
//  Created by BeeSightSoft on 12/6/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import iCarousel

class PayNowViewController: UIViewController {

    @IBOutlet weak var vCarousel: iCarousel!
    var screenWidth = UIScreen.main.bounds.size.width
    override func viewDidLoad() {
        super.viewDidLoad()
        //ShadowView.init(view: vCreditCard)
        
        vCarousel.delegate = self
        vCarousel.dataSource = self
        vCarousel.type = .coverFlow
        vCarousel.scrollToItem(at: 1, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PayNowViewController: iCarouselDataSource, iCarouselDelegate {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var itemView: UIImageView
        //create new view if no view is available for recycling
        if (view == nil) {
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 319/375 * screenWidth, height: 170))
        }
        else {
            itemView = view as! UIImageView
        }
        if index == 0 || index == 2 {
            let view = CreditCardViewController()
            let a = view.view
            itemView.addSubview(view.view)
            return itemView
        }
        else {
            let view = MasterCardViewController()
            let a = view.view
            itemView.addSubview(view.view)
            return itemView
        }
        
    }
    
    
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == .arc {
            return 2
        }
        if option == .spacing {
            return 0.1
        }
        if option == .showBackfaces {
            return 1
        }
        return value
    }
    
    
    
}
