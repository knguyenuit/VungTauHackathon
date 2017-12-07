//
//  SettingViewController.swift
//  axcro
//
//  Created by Vo Quang Huy on 8/30/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var btnMyPaymentHistory: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btnMyPaymentHistory.titleLabel?.textAlignment = .left
        btnMyPaymentHistory.imageView?.alignmentRect(forFrame: CGRect(x: 343, y: 16, width: 16, height: 16))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogoutClick(_ sender: Any) {
        ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.deleteCurrentUser()

        let mainVC = Helpers.getMainViewController()
        if let vc = mainVC {
            navigationController?.popToViewController(vc, animated: true)
            vc.tabbarController.selectedIndex = 0
            DispatchQueue.main.async {
                vc.tabbarController.hideTabBar()
            }
        }
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
