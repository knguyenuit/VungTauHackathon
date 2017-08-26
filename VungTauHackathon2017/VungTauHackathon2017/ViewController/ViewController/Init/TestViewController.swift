//
//  TestViewController.swift
//  hackAThon
//
//  Created by Vo Quang Huy on 8/26/17.
//  Copyright © 2017 Vo Quang Huy. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var vNavigationBar: UIView!
    
    let color0 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0).cgColor
    let color1 = UIColor(red: 77/255, green: 44/255, blue: 155/255, alpha: 0.8).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
