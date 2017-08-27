//
//  MainOwnerViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class MainOwnerViewController: UIViewController, UITabBarControllerDelegate {

    @IBOutlet weak var vContent: UIView!
    
    var listViewController = [UIViewController]()
    var tabbar:UITabBarController = UITabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
        
        let vcListServiceOwner = ListServicesOwnerViewController()
        let viewListServiceOwner = vcListServiceOwner.view
        vcListServiceOwner.tabBarItem = UITabBarItem(title: "List Services", image: #imageLiteral(resourceName: "icon_Phone"), tag: 0)
        
        
        
        let vcCreateService = CreateServicesViewController()
        let viewCreateService = vcCreateService.view
        vcCreateService.tabBarItem = UITabBarItem(title: "Create Services", image: #imageLiteral(resourceName: "icon_Location"), tag: 1)
        
        
        
        listViewController.append(vcListServiceOwner)
        listViewController.append(vcCreateService)
        
        
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
