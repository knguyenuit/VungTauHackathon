//
//  SelectViewController.swift
//  hackAThon
//
//  Created by Vo Quang Huy on 8/26/17.
//  Copyright © 2017 Vo Quang Huy. All rights reserved.
//

import UIKit

class SelectViewController: ViewController {

    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var tbListSelect: UITableView!
    @IBOutlet weak var btnSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tbListSelect.delegate = self
        tbListSelect.dataSource = self
        ShadowView(view: vHeader)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let currentUser = ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.getCurrentUser()
        if currentUser == nil {
            btnSignIn.isHidden = false
        } else {
            btnSignIn.isHidden = true
        }
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnSignInClick(_ sender: Any) {
        (UIApplication.shared.delegate as! AppDelegate).navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
}

extension SelectViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SellectTableViewCell", owner: self, options: nil)?.first as! SellectTableViewCell
        cell.setImage(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            (UIApplication.shared.delegate as! AppDelegate).navigationController?.pushViewController(MainGroupHotelViewController(), animated: true)
            Global.currentServices = 2
        } else if indexPath.row == 1 {
            (UIApplication.shared.delegate as! AppDelegate).navigationController?.pushViewController(MainGroupRestaurantViewController(), animated: true)
            Global.currentServices = 1
        } else if indexPath.row == 2 {
            (UIApplication.shared.delegate as! AppDelegate).navigationController?.pushViewController(ListSiteViewController(), animated: true)
        }
    }
}
