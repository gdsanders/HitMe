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

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
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
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
    }


    @IBAction func showAlert(sender: UIButton) {
        
        let difference = abs(targetValue - currentValue)
        
        let message = "The value of the slider is: \(currentValue)"
        + "\nThe target value is: \(targetValue)"
        + "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(title: "Hit Me", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
    }
    
    
    @IBAction func sliderMoved(sender: UISlider) {
        
        currentValue = lroundf(sender.value)
        
    }
}

