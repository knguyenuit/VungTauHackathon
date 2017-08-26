//
//  ListHotelViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class ListHotelViewController: UIViewController {

    @IBOutlet weak var tbListHotel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tbListHotel.delegate = self
        tbListHotel.dataSource = self
        //let cell = ListChildTableViewCell()
        //cell.ref = self
        tbListHotel.register(UINib(nibName: "ListHotelTableViewCell", bundle: nil), forCellReuseIdentifier: "ListHotelCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
    }

    @IBAction func btnFindNearByClick(_ sender: Any) {
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

extension ListHotelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 307
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbListHotel.dequeueReusableCell(withIdentifier: "ListHotelCell") as! ListHotelTableViewCell
//        cell.index = indexPath.row
//        cell.id = listChild[indexPath.row].id ?? ""
//        cell.ref = self
//        cell.lbName.text = listChild[indexPath.row].name
//        cell.pupolateAvtar(imageName: listChild[indexPath.row].avatar!)
        //cell.populateDate(name: name!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }}

