//
//  TimerViewController.swift
//  Final Project
//
//  Created by Spence on 8/3/18.
//  Copyright © 2018 Tenzin Bhuti. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
  
        @IBOutlet weak var timerLabel: UILabel!
        
        
        var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
        var timer = Timer()
        var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
        var resumeTapped = false
        
        @IBAction func startButtonTapped(_ sender: Any) {
            if isTimerRunning == false {
                runTimer()
            }
        }
        
        
        func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
     isTimerRunning=true
    }
        
    @objc func updateTimer() {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
        
        @IBAction func pauseButtonTapped(_ sender: Any) {
            
            if self.resumeTapped == false {
                timer.invalidate()
                self.resumeTapped = true
            } else {
                runTimer()
                self.resumeTapped = false        }    }
        
        
        
        @IBAction func resetButtonTapped(_ sender: Any) {
            timer.invalidate()
            seconds = 60    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false        }
        
        func timeString(time:TimeInterval) -> String {
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
