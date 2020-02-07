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
    
    let eggTimes = ["Soft": 2,"Medium": 4,"Hard": 6 ]
    
    var timeTaken = 0
    
    var totalTime = 0
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        progressBar.progress = 0.0

        titleLable.text = "Running"
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timeTaken = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func fireTimer() {
        
        if(totalTime > timeTaken){
            print(timeTaken)
            timeTaken = timeTaken + 1
            
            progressBar.progress = Float(timeTaken)/Float(totalTime)
            
        }else{
            timer.invalidate()
            totalTime = 0
            timeTaken = 0
            soundAlarm()
            titleLable.text = "Done"
        }
        
    }
    
    func soundAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }
    
    
    
}
