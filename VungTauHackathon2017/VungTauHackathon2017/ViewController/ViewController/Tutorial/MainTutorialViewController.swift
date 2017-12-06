//
//  MainTutorialViewController.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 11/8/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class MainTutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var vTutorial1: UIView!
    @IBOutlet weak var vTutorial2: UIView!
    @IBOutlet weak var sclContent: UIScrollView!
    @IBOutlet weak var vTutorial3: UIView!
    @IBOutlet weak var pcChangePage: UIPageControl!
    @IBOutlet weak var vTutorial4: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    
    var screenWidth = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sclContent.delegate = self
        
        self.automaticallyAdjustsScrollViewInsets = false
        if #available(iOS 11.0, *) {
            sclContent.contentInsetAdjustmentBehavior = .never
        } else {
            
            // Fallback on earlier versions
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let point = CGPoint(x: 0, y: 0)
        sclContent.setContentOffset(point, animated: false)
        pcChangePage.currentPage = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        let currentPage = contentOffsetX / screenWidth
        pcChangePage.currentPage = Int(currentPage)
        if Int(currentPage) == 3 {
            btnCancel.isHidden = true
        } else {
            btnCancel.isHidden = false
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let contentOffsetX = scrollView.contentOffset.x
        let currentPage = contentOffsetX / screenWidth
        pcChangePage.currentPage = Int(currentPage)
        if Int(currentPage) == 3 {
            btnCancel.isHidden = true
        } else {
            btnCancel.isHidden = false
        }
        
    }
    
    @IBAction func btnCancelClick(_ sender: Any) {
        let vc = MainScreenViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
        let vc = MainScreenViewController()
        navigationController?.pushViewController(vc, animated: true)
        
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
