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
    @IBOutlet weak var pcListCards: UIPageControl!
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
    @IBAction func btnBuyNowClick(_ sender: Any) {
        let mainVC = Helpers.getMainViewController()
        if let vc = mainVC {
            navigationController?.popToViewController(vc, animated: true)
            vc.tabbarController.selectedIndex = 1
            
        }
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 319/375 * screenWidth, height: 200))
        }
        else {
            itemView = view as! UIImageView
        }
        if index == 0 || index == 2 {
            let view = CreditCardViewController()
            if let a = view.view {
            a.layer.shadowOffset = CGSize(width: 10, height: 10)
            a.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
            a.layer.shadowOpacity = 1
            a.layer.cornerRadius = 10
            itemView.addSubview(a)
            return itemView
            } 
            
        }
        else {
            let view = MasterCardViewController()
            if let a = view.view   {
            a.layer.shadowOffset = CGSize(width: 10, height: 10)
            a.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
            a.layer.shadowOpacity = 1
            a.layer.cornerRadius = 10
            itemView.addSubview(a)
            return itemView
            }
        }
        return itemView
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
