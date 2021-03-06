//
//  AddPlayerViewController.swift
//  Tell
//
//  Created by Thanh Danh Phan on 06/04/2019.
//  Copyright © 2019 SaigLabs. All rights reserved.
//

import UIKit


class AddPlayerViewController: UIViewController, UITextFieldDelegate{
    
    
    /*** VARIABLES ***/
    var playerDataSrc: [Player] = []
    
    
    /*** OUTLETS ***/
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var myTableView: PlayersTableView!
    @IBOutlet weak var morePlayersLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
   
    
    func setUp(){
        self.nameTextField.delegate = self
        
        // Hide back buttin ub UiviewController
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let quitBtn = UIBarButtonItem.init(title: "Quit", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = quitBtn
        
        // Add 'Next Button' tot he right of the navigation controller
        let nextBarBtn = UIBarButtonItem.init(title: "Next", style: .plain, target: nil, action: #selector(playGame))
        self.navigationItem.rightBarButtonItem = nextBarBtn
        
        self.morePlayersLabel.text = ""
        
        // Hide separator lines intableView
        self.myTableView.separatorColor = UIColor.clear
        self.myTableView.allowsSelection = false
    }
    
    
    
    /*** ACTIONS ***/
    
    @IBAction func addPlayer(_ sender: Any) {
        
        // Clear any alerts
        if self.morePlayersLabel.text == "More players required"{
            self.morePlayersLabel.text = ""
        }
        
        if self.nameTextField.text != ""{
            if let enteredName = self.nameTextField.text{
                
                let newPlayer = Player.init(playerName: enteredName, boolPlayed: false)
                self.playerDataSrc.append(newPlayer)
                
                self.myTableView.playerTableDataSrc = self.playerDataSrc
                self.myTableView.reloadData()
                
                // Clear textField
                self.nameTextField.text = ""
            }   
        }
    }
    
    
    
    // ACTION WHEN RIGHT BAR BUTTON IS PRESSED
    // 'Next'
    @objc func playGame(){
        // Only go to next ViewController if there are at least 2 players
        if self.playerDataSrc.count > 1{
            let playVC = self.storyboard?.instantiateViewController(withIdentifier: "generateQ") as! GenerateQuestionViewController
            playVC.playerList = self.playerDataSrc
            self.navigationController?.pushViewController(playVC, animated: true)
        }else{
            // Show alert to let user know at least one more player is required
            print("not enough players")
            self.morePlayersLabel.text = "More players required"
            
        }
    }
    
    // Clear Player names
    @IBAction func clearNameList(_ sender: Any) {
        self.playerDataSrc.removeAll()
        self.myTableView.playerTableDataSrc.removeAll()
        self.myTableView.reloadData()
    }
    
    
}





