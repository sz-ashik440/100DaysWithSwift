//
//  ViewController.swift
//  04_Stop_Watch
//
//  Created by Admin on 3/5/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var timer = Timer()
    var startTime = TimeInterval()
    var elapsedTime: TimeInterval?
    
    // MARK: Properties
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        timeLabel.text = "00:00:00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func tapPlayButton(_ sender: UIButton) {
        self.timer = Timer.scheduledTimer(timeInterval: 0.01,
                                          target: self,
                                          selector: #selector(ViewController.resetTime),
                                          userInfo: nil,
                                          repeats: true)
        
        self.startTime = Date.timeIntervalSinceReferenceDate
        if let time = self.elapsedTime {
            print(time)
            self.startTime -= time
        }
        
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        resetButton.isEnabled = true
    }
    
    @IBAction func tapPauseButton(_ sender: UIButton) {
        timer.invalidate()
        print(self.elapsedTime!)
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = true
    }

    @IBAction func tapResetButton(_ sender: UIButton) {
        self.elapsedTime = nil
        timer.invalidate()
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        timeLabel.text = "00:00:00:00"
    }
    
    func resetTime() {
        let currentTime = Date.timeIntervalSinceReferenceDate
        
        self.elapsedTime = currentTime - self.startTime
        
        let hours = Int(self.elapsedTime!/3600)
        let minutes = Int(self.elapsedTime!/60)%3600
        let seconds = Int(self.elapsedTime!)%60
        let fractions = Int(self.elapsedTime!*100)%100
        timeLabel.text = String(format: "%02d", hours) + ":" +
            String(format: "%02d", minutes) + ":" +
            String(format: "%02d", seconds) + ":" +
            String(format: "%02d", fractions)
    }
}

