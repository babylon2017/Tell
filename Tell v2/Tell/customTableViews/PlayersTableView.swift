//
//  PlayersTableView.swift
//  Tell
//
//  Created by Thanh Danh Phan on 15/04/2019.
//  Copyright © 2019 SaigLabs. All rights reserved.
//

import UIKit

class PlayersTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var playerTableDataSrc: [Player] = []
    
    override func awakeFromNib() {
        
        self.delegate = self
        self.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Players"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.init(40)
    }
    
    
    // Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playerTableDataSrc.count
    }
    
    
    // Create Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dequeueReusableCell(withIdentifier: "nameCell") as! PlayerNameTableCell
        cell.nameLabel.text = self.playerTableDataSrc[indexPath.row].name
        return cell
    }
       
}

