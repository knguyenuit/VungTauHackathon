//
//  Helpers.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 12/7/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import UIKit

class Helpers {
    //get main vc
    static func getMainViewController() -> MainScreenViewController? {
        for vc in ((UIApplication.shared.delegate as! AppDelegate).navigationController?.viewControllers)! {
            if vc is MainScreenViewController {
                return vc as! MainScreenViewController
            }
        }
        return nil
    }
}
