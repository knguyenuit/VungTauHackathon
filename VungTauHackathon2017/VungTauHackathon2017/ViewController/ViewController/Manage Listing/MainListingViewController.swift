//
//  MainListingViewController.swift
//  axcro
//
//  Created by Khanh Nguyen on 9/14/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

import NVActivityIndicatorView



class MainListingViewController: UIViewController {

    @IBOutlet weak var btnMyEarning: UIButton!
    @IBOutlet weak var btnAZ: UIButton!
    @IBOutlet weak var btnRecent: UIButton!
    @IBOutlet weak var btnHidden: UIButton!
    @IBOutlet weak var tbMyListingVerify: UITableView!
    @IBOutlet weak var tbMyListing: UITableView!
    @IBOutlet weak var cstbHeightMyListingVerify: NSLayoutConstraint!
    
    
    
    var listing = Listings()
    var listListing = [Listings]()
    var listListingUpdated = [Listings]()
    var listListingHidden = [Listings]()
    
    var isAZ = true
    var isUpdated = false
    var isHidden = false
    
    var currentPageAZ = 1
    var currentPageUpdated = 1
    var currentPageHidden = 1
    
    var isLoadMoreData = true
    
    @IBOutlet weak var cstbHeightMyListing: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupTableView()
    }
    
    func setupTableView() {
        tbMyListingVerify.register(UINib(nibName: "MyListingVerifyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyListingVerifyCell")
        tbMyListingVerify.delegate = self
        tbMyListingVerify.dataSource = self
        
        tbMyListing.register(UINib(nibName: "MyListingTableViewCell", bundle: nil), forCellReuseIdentifier: "MyListingCell")
        tbMyListing.delegate = self
        tbMyListing.dataSource = self
        
    }

    @IBAction func btnNewListingClick(_ sender: Any) {
       
    }
    

    

    
    @IBAction func btnEarningClick(_ sender: Any) {
        
        
    }
   



    
}

extension MainListingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbMyListingVerify {
            return 1
        } else {
            return 3
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tbMyListingVerify {
            return 72
        } else {
            return 128
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbMyListingVerify {
            let cell = tbMyListingVerify.dequeueReusableCell(withIdentifier: "MyListingVerifyCell") as! MyListingVerifyTableViewCell

            return cell
        } else {

            let cell = tbMyListing.dequeueReusableCell(withIdentifier: "MyListingCell") as! MyListingTableViewCell
            
            return cell
        }
        
    }
    
  
    
   
    
}

