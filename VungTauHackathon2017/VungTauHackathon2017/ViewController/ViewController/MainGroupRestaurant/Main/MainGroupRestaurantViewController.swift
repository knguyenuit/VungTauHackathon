//
//  MainGroupRestaurantViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class MainGroupRestaurantViewController: UIViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var vContent: UIView!

    var listViewController = [UIViewController]()
    var tabbar:UITabBarController = UITabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.delegate = self
        
        let vcListRestaurant = ListRestaurantViewController()
        let viewListRestaurant = vcListRestaurant.view
        vcListRestaurant.tabBarItem = UITabBarItem(title: "List Restaurant", image: #imageLiteral(resourceName: "icon_Phone"), tag: 0)
        
        
        
        let vcListHotelMap = ListHotelMapViewController()
        let viewHotelMap = vcListHotelMap.view
        vcListHotelMap.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "icon_Location"), tag: 1)
        
        
        
        listViewController.append(vcListRestaurant)
        listViewController.append(vcListHotelMap)
        
        
        tabbar.setViewControllers(listViewController, animated: true)
        
        tabbar.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tabbar.view.frame = vContent.bounds
        vContent.autoresizesSubviews = true
        vContent.addSubview(tabbar.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
