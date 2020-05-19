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
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    
    var player: AVAudioPlayer!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var progressbar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressbar.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            
            progressbar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playAlarmSound()
        }
    }
    
    func playAlarmSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
//    startTimer(startSeconds: 5)
//    var timer: Timer?
//    func startTimer(startSeconds: Int) {
//        self.secondsRemaining = startSeconds
//        if timer == nil {
//            timer = Timer(timeInterval: 1, repeats: true) {
//                [weak self] timer in
//                if (self?.secondsRemaining == 0) {
//                    timer.invalidate()
//                }
//                self?.decrementSecondsAndPrint()
//            }
//            RunLoop.current.add(timer!, forMode: .common)
//        }
//
//    }
//
//    func decrementSecondsAndPrint() {
//        print(secondsRemaining)
//        secondsRemaining -= 1
//        timer = nil
//    }
    
    
}
