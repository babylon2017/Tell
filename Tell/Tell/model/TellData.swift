//
//  TellData.swift
//  Tell
//
//  Created by Thanh Danh Phan on 06/04/2019.
//  Copyright © 2019 SaigLabs. All rights reserved.
//

import Foundation

class TellData{
    
    // Array to store past questions
    let pastQ: [String]?
    
    // Array to store future questions
    let futureQ: [String]?
   
    init() {
        
        // Initialise past and future questions
        self.pastQ = [
            "What did you do yesterday?",
            "How did you spend your last Birthday?",
            "Tell us about your best holiday?",
            "Tell us about your favourite subject at school?",
            "What did you do last Christmas?"
        ]
        
        // Future questions
        self.futureQ = [
            "What are your goals in the next 5 years?",
            "What would your ideal holiday look like?",
            "What are your plans for the New year?",
            "How would you like to spend your next Birthday?",
            "What would you liek to do when you retire?"
        ]
        
    }
    
}

