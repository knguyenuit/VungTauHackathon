//
//  MyPurchasesViewController.swift
//  axcro
//
//  Created by Vo Quang Huy on 9/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit


enum MyPurchaseViewType : Int {
    case az = 0
    case recent = 1
    case expiredfully = 2
}

class MyPurchasesViewController: UIViewController {
    @IBOutlet weak var btnAZ: UIButton!
    @IBOutlet weak var btnRecent: UIButton!
    @IBOutlet weak var btnExpiredFullyRedeem: UIButton!
    @IBOutlet weak var tbPurchases: UITableView!
    @IBOutlet weak var vShowPurchases: UIView!
    var viewType : MyPurchaseViewType = .recent {
        didSet {
            self.needReload = true
        }
    }
    //var viewType : MyPurchaseViewType!
    var tabButtons : [UIButton] = []
    


    var currentPageAZ = 1
    var currentPageRecent = 1
    var currentPageExpired = 1
    
    var needReload: Bool = true
    
//    var isAZ = false
//    var isRecent = true
//    var isExpired = false
    
    var isLoadMoreData = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabButtons = [ btnAZ, btnRecent, btnExpiredFullyRedeem]
        tbPurchases.delegate = self
        tbPurchases.dataSource = self
        tbPurchases.register(UINib(nibName: "MyPurchasesTableViewCell", bundle: nil), forCellReuseIdentifier: "MyPurchasesCell")
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        setUpView()
        //loadDataWhenLoadView()
        updateViewType()
    }
  

    func setUpView() {
        ShadowView.init(view: vShowPurchases)
        updateViewType()
    }
    
    func changeColorButton (buttonClick: UIButton, button1: UIButton, button2: UIButton){
        
        let colorCLick = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        let colorNotClick = UIColor(red: 0, green: 0, blue: 0, alpha: 0.54)
        buttonClick.setTitleColor(colorCLick, for: .normal)
        buttonClick.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        button1.setTitleColor(colorNotClick, for: .normal)
        button1.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        button2.setTitleColor(colorNotClick, for: .normal)
        button2.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        
    }
    
    
    
   
    
   
    @IBAction func btnAZClick(_ sender: Any) {
//        isAZ = true
//        isRecent = false
//        isExpired = false
//        changeColorButton(buttonClick: btnAZ, button1: btnRecent, button2: btnExpiredFullyRedeem)
//        if listAZ.count  == 0 {
//            loadListAZ()
//        } else {
//            DispatchQueue.main.async {
//                self.tbPurchases.reloadData()
//            }
//        }
        viewType = .az
        updateViewType()
    }
    
    @IBAction func btnRecentClick(_ sender: Any) {

        updateViewType()
    }
    
    @IBAction func btnExpiredRedeemClick(_ sender: Any) {
        viewType = .expiredfully

        updateViewType()
    }
    
    func updateViewType() {
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyPurchasesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbPurchases.dequeueReusableCell(withIdentifier: "MyPurchasesCell", for: indexPath) as! MyPurchasesTableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
}
