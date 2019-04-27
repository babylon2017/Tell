//
//  PlayerNameTableCell.swift
//  Tell
//
//  Created by Thanh Danh Phan on 16/04/2019.
//  Copyright © 2019 SaigLabs. All rights reserved.
//

import UIKit

class PlayerNameTableCell: UITableViewCell {
    
    /*** OUTLETS ***/
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func addTextLabel(text: String){
        nameLabel.text = text
    }
    
    
}




