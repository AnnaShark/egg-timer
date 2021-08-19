//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
            timer.invalidate()
            let hardness = sender.currentTitle!
            let result = eggTimes[hardness]!
            totalTime = result * 60
            print(totalTime)
        
            progressBar.progress = 0.0
            secondsPassed = 0
            self.label.text = hardness
        
        
        
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer(){
    
    if secondsPassed < totalTime {
                    print ("\(totalTime) seconds")
                    secondsPassed += 1
                    self.progressBar.progress = Float(secondsPassed)/Float(totalTime)
                    print ("\( self.progressBar.progress) progress")
                    
                    
                } else {
                    timer.invalidate()
                    self.label.text = "Done"
                    
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
                    player = try! AVAudioPlayer(contentsOf: url)
                    player.play()
                }
            }
        
    }


