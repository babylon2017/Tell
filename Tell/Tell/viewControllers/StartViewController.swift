//
//  StartViewController.swift
//  Tell
//
//  Created by Thanh Danh Phan on 06/04/2019.
//  Copyright © 2019 SaigLabs. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    /*** ACTIONS ***/
    @IBAction func startPlaying(_ sender: Any) {
        let AddPlayerVC = self.storyboard?.instantiateViewController(withIdentifier: "addPlayerVC") as! AddPlayerViewController
        self.navigationController?.pushViewController(AddPlayerVC, animated: true)
    }
    
    
    
}


