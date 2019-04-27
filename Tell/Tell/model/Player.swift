//
//  Player.swift
//  Tell
//
//  Created by Thanh Danh Phan on 15/04/2019.
//  Copyright © 2019 SaigLabs. All rights reserved.
//

import Foundation

class Player{
    
    var name: String?
    var hasPlayed: Bool?
    
    init(playerName: String, boolPlayed: Bool) {
        
        self.name = playerName
        self.hasPlayed = boolPlayed
        
    }
    
    
}


