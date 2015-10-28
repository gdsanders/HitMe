//
//  ViewController.swift
//  HitMe
//
//  Created by G.D. Sanders on 10/27/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }


    @IBAction func showAlert(sender: UIButton) {
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let title: String
        
        if difference == 0 {
            title = "Perfect! ✭✭🎖✭✭"
        }  else if difference < 5 {
            title = "Almost!  Very good score! 😎 "
        }  else if difference < 10 {
            title = "Pretty good. Have a 🌮"
        } else {
            title = "Come on. You can do better! 👎"
        }
        
        
        let message = "You scored \(points) points"
                    + "\nYour guess was \(currentValue)"
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.startNewRound()
            self.updateLabels()})
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func sliderMoved(sender: UISlider) {
        
        currentValue = lroundf(sender.value)
        
    }
}

