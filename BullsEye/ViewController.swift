//
//  ViewController.swift
//  BullsEye
//
//  Created by armno on 11/24/2558 BE.
//  Copyright © 2558 armno. All rights reserved.
//

import UIKit
import QuartzCore

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
    
    let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, forState: .Normal)
    
    let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
      let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
      slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
    }
    
    if let trackRightImage = UIImage(named: "SliderTrackRight") {
      let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
      slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert() {
    
    let difference = abs(currentValue - targetValue)
    let points = 100 - difference
    var bonus = 0
    let title: String

    
    if points == 100 {
      title = "Perfect!"
      bonus = 100
    } else if points > 90 {
      title = "You almost had it!"
    } else if points > 50 {
      title = "Nice try!"
    } else {
      title = "Not even close!"
    }
    
    score = score + points + bonus
    
    let message = "Your score is: \(points + bonus) points"
    
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "OK", style: .Default, handler: {
      action in self.startNewRound()
                self.updateLabels()
    })
    
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
    
  }
  
  @IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func startOverTouched() {
    startNewGame()
    updateLabels()
    
    let transition = CATransition()
    transition.type = kCATransitionFade
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    view.layer.addAnimation(transition, forKey: nil)
  }
  
  func startNewGame() {
    round = 0
    score = 0
    startNewRound()
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

