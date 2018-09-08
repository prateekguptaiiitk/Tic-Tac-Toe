//
//  ViewController.swift
//  Tic Tac Toe Game
//
//  Created by Prateek Gupta on 26/01/18.
//  Copyright © 2018 Prateek Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1        //Cross
    var gameState = [0, 0, 0, 0, 0, 0 ,0, 0, 0]
    var gameIsActive = true
    var gameEnd = false
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: UIButton) {
        
        if gameState[sender.tag - 1] == 0 && gameIsActive == true
        {
            gameState[sender.tag - 1] = activePlayer
            
            if activePlayer == 1
            {
                sender.setImage(UIImage(named : "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named : "Nought.png"), for: UIControlState())
                activePlayer = 1
            }

        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                gameEnd = true
                
                if gameState[combination[0]] == 1
                {
                    label.text = "CROSS HAS WON!"            //Cross Has Won
                }
                else
                {
                    label.text = "NOUGHT HAS WON!"           //Nought Has Won
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false

            }
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0 && gameEnd == false
            {
                gameIsActive = true
            }
        }
        
        if gameIsActive == false && gameEnd == false
        {
            label.text = "IT WAS A DRAW!"                    //Draw Match
            label.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: UIButton) {
        
         activePlayer = 1
         gameState = [0, 0, 0, 0, 0, 0 ,0, 0, 0]
         gameIsActive = true
         gameEnd = false
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

