//
//  ViewController.swift
//  BullsEye
//
//  Created by armno on 11/24/2558 BE.
//  Copyright © 2558 armno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
    updateLabels()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert() {
    
    let difference = abs(currentValue - targetValue)
    let points = 100 - difference
    
    score += points
    
    let message = "Your score is: \(points) points"
    
    let alert = UIAlertController(title: "Hello wolrd", message: message, preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
    
    startNewRound()
    updateLabels()
    
  }
  
  @IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  func startNewRound() {
    round += 1
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }


}

