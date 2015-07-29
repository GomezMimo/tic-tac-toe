//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Juan Gomez on 6/07/15.
//  Copyright (c) 2015 Codes and Tags. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var codesLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var resultMessage: UILabel!
    @IBOutlet weak var button: UIButton!
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameActive = true
    var player = 1
    var counter = 0
    var winnerCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    @IBAction func playAgainButton(sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        player = 1
        counter = 0
        var button = UIButton()
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        resultMessage.hidden = true
        resultMessage.center = CGPointMake(resultMessage.center.x - 400, resultMessage.center.y)
        playAgain.hidden = true
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
    }
    @IBAction func buttonAction(sender: AnyObject) {
        var image = UIImage()
        if gameState[sender.tag] == 0 && gameActive == true{
            if player == 1 {
                image = UIImage(named: "juan.jpg")!
                gameState[sender.tag] = player
                player = 2
            }else{
                image = UIImage(named: "sara.jpg")!
                gameState[sender.tag] = player
                player = 1
            }
            
            for combination in winnerCombination{
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    if gameState[combination[1]] == 1{
                        resultMessage.text = "Juan has won"
                    }else if gameState[combination[1]] == 2{
                        resultMessage.text = "Sara has won"
                    }
                    resultMessage.hidden = false
                    playAgain.hidden = false
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.resultMessage.center = CGPointMake(self.resultMessage.center.x + 400, self.resultMessage.center.y)
                        self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)                       
                    })
                    
                    gameActive = false
                }
                
                counter++;
                
            }
            if counter >= 72 {
                    resultMessage.text = "It's a draw"
                    resultMessage.hidden = false
                    playAgain.hidden = false
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.resultMessage.center = CGPointMake(self.resultMessage.center.x + 400, self.resultMessage.center.y)
                        self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)
                    })
            }
            sender.setImage(image, forState: .Normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultMessage.hidden = true
        resultMessage.center = CGPointMake(resultMessage.center.x - 400, resultMessage.center.y)
        playAgain.hidden = true
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
    }
    
    override func viewDidLayoutSubviews() {
        codesLabel.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(3, animations: { () -> Void in
            self.codesLabel.alpha = 1
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

