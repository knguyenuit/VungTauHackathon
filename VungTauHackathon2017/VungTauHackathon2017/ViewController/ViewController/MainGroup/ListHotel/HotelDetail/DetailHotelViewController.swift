//
//  DetailDishViewController.swift
//  TestCollectionView
//
//  Created by Vo Quang Huy on 6/26/17.
//  Copyright © 2017 Vo Quang Huy. All rights reserved.
//

import UIKit
import Kingfisher

class DetailHotelViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var optionCollectionView: UICollectionView!
    @IBOutlet weak var vContent: UIView!
    @IBOutlet weak var lblNumberComment: UILabel!
    @IBOutlet weak var lblNamePlace: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var imgMainDetailImage: UIImageView!
    
    var name = ""
    var address = ""
    var phoneNumber = ""
    var avatar = ""
    
    var listOption: [String] = ["Detail", "Comment", "Map view"]
    var selectOption = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.optionCollectionView.register(UINib(nibName:"DetailHotelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectioncell")
        self.optionCollectionView.delegate = self
        self.optionCollectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lblNamePlace.text = name
        lblAddress.text = address
        lblNumberComment.text = phoneNumber
        if Global.currentServices == 2 {
           imgMainDetailImage.image = UIImage(named: avatar)
            
        } else {
            var urlImage = URL(string: avatar)
            imgMainDetailImage.kf.setImage(with: urlImage)
        }
        
    }

    @IBAction func btnBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! DetailHotelCollectionViewCell
        cell.nameOption.text = listOption[indexPath.item]
        
        if indexPath.item == selectOption {
            cell.nameOption.textColor = UIColor(red: 234/255, green: 160/255, blue: 214/255, alpha: 1)
            cell.vHighlight.backgroundColor = UIColor(red: 234/255, green: 160/255, blue: 214/255, alpha: 1)
        }
        else {
            cell.nameOption.textColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
            cell.vHighlight.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }
        
        if selectOption == 2
        {
            vContent.isHidden = true
        }
        
        if selectOption == 0
        {
            vContent.isHidden = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectOption = indexPath.item
        if indexPath.item == 0 {
            let vc = OverviewHotelViewController()
            vc.view.frame = vContent.bounds
            vContent.addSubview(vc.view)
        } else if indexPath.item == 1 {
            let vc = ServiceMapViewController()
            vc.view.frame = vContent.bounds
            vContent.addSubview(vc.view)
        }
        collectionView.reloadData()
    }
}

//extension DetailDishViewController: UITableViewDelegate, UITableViewDataSource{
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        3
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = Bundle.main.loadNibNamed("DetailMaterialTableViewCell", owner: self, options: nil)?.first as! DetailMaterialTableViewCell
//        return cell
//    }
//}

