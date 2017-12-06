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
