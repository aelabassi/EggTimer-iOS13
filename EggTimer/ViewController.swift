//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CountdownTimer {
    var timer: Timer?
    private var _secondsRemaining: Int

        var remainingSeconds: Int {
            get {
                return _secondsRemaining
            }
            set {
                _secondsRemaining = newValue
                // Restart the timer with the new remaining seconds
                timer?.invalidate()
                start()
            }
        }
    
    init(seconds: Int){
        self._secondsRemaining = seconds
    }
    
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){[weak self] timer in
            guard let self = self else {return}
            
            if self.remainingSeconds > 0 {
                self._secondsRemaining -= 1
                print("seconds remaining \(self.remainingSeconds) seconds")
            }else{
                self.timer?.invalidate()
                print("Countdown finished")
            }
        }
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimer = ["Soft": 300, "Medium": 320, "Hard": 720]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    
    @IBAction func hardenessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimer[hardness]!
        secondsPassed = 0
        progressView.progress = 0.0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil ,repeats: true)
        
        
    
        
    }
    
    @objc func updateTimer(){
        if secondsPassed <= totalTime {
            progressView.progress = Float(secondsPassed)/Float(totalTime)
            secondsPassed += 1
        }else{
            timer.invalidate()
            titleLabel.text = "DONE !!"
        }
    }
    
}
