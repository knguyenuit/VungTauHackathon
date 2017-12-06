//
//  ShadowView.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 12/6/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import UIKit

class ShadowView {
    
    init(view: UIView) {
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        view.layer.borderWidth = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        view.layer.shadowOpacity = 0.7
    }
    
}
