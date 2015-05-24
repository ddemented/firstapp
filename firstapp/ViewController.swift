//
//  ViewController.swift
//  firstapp
//
//  Created by Sanjeev Suresh on 5/23/15.
//  Copyright (c) 2015 Sanjeev Suresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var LOGO: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var enemyScore: UILabel!
    @IBOutlet weak var EndLabel: UILabel!
    
    
    var cardNameArray:[String] = ["ace","card2","card3","card4","card5","card6","card7","card8","card9","card10","jack","queen","king"]
    
    
    var playerScoreTotal = 0
    var enemyScoreTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.EndLabel.hidden = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playRoundTapped(sender: UIButton) {
        
        var firstRandomNumber = Int(arc4random_uniform(13))
        var firstCardString:String = self.cardNameArray[firstRandomNumber]
        
        var secondRandomNumber = Int(arc4random_uniform(13))
        var secondCardString:String = self.cardNameArray[secondRandomNumber]
        
        
        self.firstCardImageView.image = UIImage(named: firstCardString)
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        if firstRandomNumber > secondRandomNumber {
            //first high
            playerScoreTotal += 1;
            self.playerScore.text = String(playerScoreTotal)
        } else if firstRandomNumber == secondRandomNumber {
            //equal
        } else {
            //second is high
            enemyScoreTotal += 1;
            self.enemyScore.text = String(enemyScoreTotal)
        }
        
        if playerScoreTotal == 15 {
            self.EndLabel.hidden = false
            self.EndLabel.text = "You Win!"
            self.playRoundButton.hidden = true
        }
        
        if enemyScoreTotal == 15 {
            self.EndLabel.hidden = false
            self.EndLabel.text = "Computer Wins!"
            self.playRoundButton.hidden = true
        }
    }
}

