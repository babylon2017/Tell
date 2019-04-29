//
//  GenerateQuestionViewController.swift
//  Tell
//
//  Created by Thanh Danh Phan on 06/04/2019.
//  Copyright © 2019 SaigLabs. All rights reserved.
//

import UIKit

class GenerateQuestionViewController: UIViewController {
    
    
    /*** VARIABLES ***/
    var TallDataObj: TellData!
    var playerList: [Player]?
    
    
    
    /* OUTLETS */
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pastQBtn: UIButton!
    @IBOutlet weak var futureBtn: UIButton!
    @IBOutlet weak var nextPlayerBtn: UIButton!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var questionContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSizeOfButtons()
        setUp()
        
        // Show first plyer
        if let players = playerList{
            let player = selectRandomPlayer(listOf: players)
            playerNameLabel.text = player!
        }
    }
    
    /*** CUSTOM FUNCTIONS ***/
    
    // To handle portrait/ Landscap orientation
    func setSizeOfButtons(){
        pastQBtn.translatesAutoresizingMaskIntoConstraints = false
        futureBtn.translatesAutoresizingMaskIntoConstraints = false
        
        pastQBtn.leadingAnchor.constraint(equalTo: questionContainer.leadingAnchor, constant: 0).isActive = true
        pastQBtn.topAnchor.constraint(equalTo: questionContainer.topAnchor, constant: 0).isActive = true
        pastQBtn.bottomAnchor.constraint(equalTo: questionContainer.bottomAnchor, constant: 0).isActive = true
        pastQBtn.widthAnchor.constraint(equalTo: questionContainer.widthAnchor, multiplier: 0.5).isActive = true
        
        futureBtn.trailingAnchor.constraint(equalTo: questionContainer.trailingAnchor, constant: 0).isActive = true
        futureBtn.topAnchor.constraint(equalTo: questionContainer.topAnchor, constant: 0).isActive = true
        futureBtn.bottomAnchor.constraint(equalTo: questionContainer.bottomAnchor, constant: 0).isActive = true
        futureBtn.widthAnchor.constraint(equalTo: questionContainer.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setUp(){
        self.questionLabel.textColor = UIColor.gray
        
        // Initialise instance of TellData
        self.TallDataObj = TellData.init()
        
        disableSelectPlayerAndFinishBtn()
        playerNameLabel.text = ""
        resetHasPlayedAttribPlayerList(players: self.playerList)
    }
    
    func resetHasPlayedAttribPlayerList(players: [Player]?){
        if let newListOfPlayers = players{
            for player in newListOfPlayers{
                player.hasPlayed = false
            }
            self.playerList = newListOfPlayers
        }
    }
    
    // Generate random element from [String]
    func generateRandomElement(array: [String]) -> String{
        let numElem = array.count
        let randomInt = Int.random(in: 0 ..< numElem)
        return array[randomInt]
    }
    
    func changeButtonColor(buttonSelected: String){
        
        if buttonSelected == "past"{
            // (#8FB9A8, RGB -> (red: 143, green: 185, blue: 168, alpha: 0)) divide by 255
            // Fade out unselected button
            self.questionLabel.textColor = UIColor.init(red: 0.56, green: 0.73, blue: 0.66, alpha: 1)
            self.pastQBtn.isEnabled = false
            self.futureBtn.disableFutureQBtn()
           
        }else{
            // Future Question button selected
            //(#765D69, RGB -> (red: 118, green: 93, blue: 105, alpha: 1)) divide by 255 )
            // Fade out unselected button
            self.questionLabel.textColor = UIColor.init(red: 0.46, green: 0.36, blue: 0.41, alpha: 1)
            self.futureBtn.isEnabled = false
            self.pastQBtn.disablePastQBtn()
        }
    }
    
    // Select random player from [TellData.Player].  Returns a name (String)
    // Return of 'nil' means everybody has played and the game is over
    func selectRandomPlayer(listOf players: [Player]) -> String? {
        
        // Get array of players that has not yet played
        var listHasNotPlayed = [Player]()
        listHasNotPlayed = players.filter{ $0.hasPlayed == false }
        
        if listHasNotPlayed.count == 0{ // Every body has played
            return nil
        }else{
            // Select random player
            let numElem = listHasNotPlayed.count
            let randomInt = Int.random(in: 0 ..< numElem)
            let selectedPlayer = listHasNotPlayed[randomInt]
            
            // Update master list of players (update info on which players have played)
            if let playerList = self.playerList{
                
                let nameOfPlayerJustPlayed = selectedPlayer.name!
                for player in playerList{
                    if player.name == nameOfPlayerJustPlayed{
                        player.hasPlayed = true
                    }
                }
                self.playerList = playerList
            }
            return selectedPlayer.name
        }
    }
    
    // Reset both question generating button back to their default settings and appearances
    func resetAllQuestionBtnsToDefault(){
        
        // Past Questions Button
        self.pastQBtn.isEnabled = true
        self.pastQBtn.backgroundColor = UIColor.init(red: 0.56, green: 0.73, blue: 0.66, alpha: 1)
        self.pastQBtn.setTitleColor(UIColor.black, for: .normal)
        
        // Future Questions Buttons
        self.futureBtn.isEnabled = true
        self.futureBtn.backgroundColor = UIColor.init(red: 0.46, green: 0.36, blue: 0.41, alpha: 1)
    }
    
    func disableSelectPlayerAndFinishBtn(){
        self.nextPlayerBtn.isEnabled = false
    }
    
    /* ACTIONS */
    
    @IBAction func showFutureQuestions(_ sender: Any) {
        
        let question = self.generateRandomElement(array: self.TallDataObj.futureQ!)
        self.questionLabel.text = question
        changeButtonColor(buttonSelected: "future")
        self.nextPlayerBtn.isEnabled = true
    }
    
    @IBAction func showPastQuestion(_ sender: Any) {
        
        let question = self.generateRandomElement(array: self.TallDataObj.pastQ!)
        self.questionLabel.text = question
        changeButtonColor(buttonSelected: "past")
        self.nextPlayerBtn.isEnabled = true
    }
    
    // 'Next Player'
    @IBAction func nextPlayerAction(_ sender: Any) {
       
        playerNameLabel.text = ""
        
        // Check if any players have not yet played
        if let listOfPlayers = self.playerList{
            let playersNotPlayed = listOfPlayers.filter{ $0.hasPlayed == false}
            if playersNotPlayed.count == 0{
                
                questionLabel.text = "Game Over"
                questionLabel.textColor = UIColor.orange
                
                // Show UIBarButtonItem 'Play Again'
                let playAgainBtn = UIBarButtonItem.init(title: "Play Again", style: .plain, target: self, action: #selector(playAgain))
                self.navigationItem.rightBarButtonItem = playAgainBtn
                
                // Disable 'Next Player'
                nextPlayerBtn.isEnabled = false
                
            }else{
                resetPlay()
            }
        }
    }
    
    
    @objc func playAgain(){
        resetPlay()
        
        if let listOfPlayers = self.playerList{
            for player in listOfPlayers{
                player.hasPlayed = false
            }
            self.playerList = listOfPlayers
        }
        showNextPlayer()
    }
    
    func resetPlay(){
        
        // Reset Labels
        self.questionLabel.text = "Select a Question"
        self.questionLabel.textColor = UIColor.gray
        
        playerNameLabel.text = ""
        
        // Reset questions buttons
        self.pastQBtn.backgroundColor = UIColor.init(red: 0.56, green: 0.73, blue: 0.66, alpha: 1)
        self.pastQBtn.setTitleColor(UIColor.black, for: .normal)
        self.futureBtn.isEnabled = true
        self.futureBtn.backgroundColor = UIColor.init(red: 0.46, green: 0.36, blue: 0.41, alpha: 1)
        self.pastQBtn.isEnabled = true
        self.futureBtn.isEnabled = true
        self.nextPlayerBtn.isEnabled = false
        
        // Select next random player
        showNextPlayer()
    }
    
    func showNextPlayer(){
        if let listOfPlayers = self.playerList{
            if let selectedPlayer = selectRandomPlayer(listOf: listOfPlayers){
                self.playerNameLabel.text = selectedPlayer
            }
        }
    }
    
}





