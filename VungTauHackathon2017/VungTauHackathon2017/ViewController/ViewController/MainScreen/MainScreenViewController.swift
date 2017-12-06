//
//  MainScreenViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UITabBarControllerDelegate {

    @IBOutlet weak var vContent: UIView!
    var listViewController = [UIViewController]()
    var listChangeViewController = [UIViewController]()
    var tabbarController: UITabBarController = UITabBarController()
    
    var vcHomeScreen = SelectViewController()
    var vcHotel = ListHotelViewController()
    var vcRestaurant = MainListingViewController()
    var vcSetting = InitViewController()
//    var vcNewListing = MyListingsViewController()
//    var vcMainListing = MainListingViewController()
//    var vcMoreSetting = MoreSettingViewController()
    
    var isAppearWhenFirstCreateMerchant = false
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegate when logout
        //vcMoreSetting.deleteListingWhenLogoutDelegate = vcMainListing
    }
    
    func setupTabbar(homeScreenVC: UIViewController, newListingVC: UIViewController, myListingVC: UIViewController, moreSettingVC: UIViewController) {
        let currentUser = ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.getCurrentUser()
        listViewController.removeAll()
        
        self.tabbarController.delegate = self
        
        let homeScreenVC = homeScreenVC
        let viewHomeScreen = homeScreenVC.view
        homeScreenVC.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icHome"), tag: 0)
        homeScreenVC.tabBarItem.selectedImage =  #imageLiteral(resourceName: "icHomeSelected").withRenderingMode(.alwaysOriginal)
        
        let myListingVC = myListingVC
        let viewMyListing = myListingVC.view
        myListingVC.tabBarItem = UITabBarItem(title: "My Services", image: #imageLiteral(resourceName: "icMyListing"), tag: 2)
        myListingVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "icMyListingSelected").withRenderingMode(.alwaysOriginal)
        //myListingVC.tabBarItem.selectedImage?.renderingMode = .alwaysOriginal
        
        let moreSettingVC = moreSettingVC
        let viewMoreSetting = moreSettingVC.view
        moreSettingVC.tabBarItem = UITabBarItem(title: "More", image: #imageLiteral(resourceName: "icMore") , tag: 3)
        moreSettingVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "icMoreSelected").withRenderingMode(.alwaysOriginal)
        // moreSettingVC.tabBarItem.selectedImage?.renderingMode = .alwaysOriginal
        
        let newListingVC = newListingVC
        let viewNewListing = newListingVC.view
        newListingVC.tabBarItem = UITabBarItem(title: "My Purchases", image: #imageLiteral(resourceName: "icPurchase"), tag: 1)
        newListingVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "icPurchaseSelected").withRenderingMode(.alwaysOriginal)
        // newListingVC.tabBarItem.selectedImage?.renderingMode = .alwaysOriginal
        
        
        listViewController.append(homeScreenVC)
        listViewController.append(newListingVC)
        listViewController.append(myListingVC)
        listViewController.append(moreSettingVC)
        
        
        let textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.54)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: textColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: textColor], for: .selected)
        
        tabbarController.setViewControllers(listViewController, animated: true)
        tabbarController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tabbarController.view.frame = vContent.bounds
        tabbarController.tabBar.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        
        
        vContent.autoresizesSubviews = true
        vContent.addSubview(tabbarController.view)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.showTabBar(self.tabbarController)
        }
        let currentUser = ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.getCurrentUser()
        //let merchant = ApplicationAssembler.sharedInstance.resolver.resolve(PMerchantService.self)?.getCurrentMerchant()
//        if currentUser != nil {
//            if currentUser?.isMerchant == 1 || currentUser?.isMerchant == 2 {
//                setupTabbar(homeScreenVC: vcHomeScreen, newListingVC: vcPurchase, myListingVC: vcMainListing, moreSettingVC: vcMoreSetting)
//            } else {
//                setupTabbar(homeScreenVC: vcHomeScreen, newListingVC: vcPurchase, myListingVC: vcNewListing, moreSettingVC: vcMoreSetting)
//            }
//        } else {
//            setupTabbar(homeScreenVC: vcHomeScreen, newListingVC: vcTest, myListingVC: vcNewListing, moreSettingVC: vcMoreSetting)
//        }
        setupTabbar(homeScreenVC: vcHomeScreen, newListingVC: vcHotel, myListingVC: vcRestaurant, moreSettingVC: vcSetting)
        
        if currentUser == nil {
            DispatchQueue.main.async {
                self.hideTabBar(self.tabbarController)
            }

        } else {
            DispatchQueue.main.async {
                self.showTabBar(self.tabbarController)
            }

        }
        
       
        
        tabbarController.tabBar.reloadInputViews()
        //tabbarController.selectedIndex = 3
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func setViewController(selectedIndex: Int) {
        self.tabbarController.selectedIndex = selectedIndex
    }
    
    func hideTabBar(_ tabbarcontroller: UITabBarController) {
        let screenRect: CGRect = UIScreen.main.bounds
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        tabbarcontroller.view.frame = CGRect(x: tabbarcontroller.view.frame.origin.x, y: tabbarcontroller.view.frame.origin.y, width: tabbarcontroller.view.frame.width, height: screenRect.height + tabbarcontroller.tabBar.frame.height)
        UIView.commitAnimations()
    }
    
    func showTabBar(_ tabbarcontroller: UITabBarController) {
        let screenRect: CGRect = UIScreen.main.bounds
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        tabbarcontroller.view.frame = screenRect
        UIView.commitAnimations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension UITabBarController {
    
    func hideTabBar() {
        let screenRect: CGRect = UIScreen.main.bounds
        
        self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: screenRect.height + self.tabBar.frame.height)
    }
    
    func showTabBar() {
        let screenRect: CGRect = UIScreen.main.bounds
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        self.view.frame = screenRect
        UIView.commitAnimations()
    }
}
