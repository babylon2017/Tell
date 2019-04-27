//
//  ButtonExtensions.swift
//  Tell
//
//  Created by Thanh Danh Phan on 19/04/2019.
//  Copyright © 2019 SaigLabs. All rights reserved.
//

import UIKit

extension UIButton{
    
    func disableFutureQBtn(){
        self.backgroundColor = UIColor.init(red: 0.46, green: 0.36, blue: 0.41, alpha: 0.2)
        self.isEnabled = false
    }
    
    func disablePastQBtn(){
        self.backgroundColor = UIColor.init(red: 0.56, green: 0.73, blue: 0.66, alpha: 0.2)
        self.setTitleColor(UIColor.gray, for: .normal)
        self.isEnabled = false
    }
}

