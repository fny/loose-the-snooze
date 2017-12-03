//
//  HomeViewController.swift
//  LoseTheSnooze
//
//  Created by Vicki Lu on 11/11/17.
//  Copyright © 2017 Duke Catalyst. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class HomeViewController: UIViewController {
   
    @IBOutlet weak var wakeUpTime: UILabel!
    var seconds = Double()
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var onOff: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wakeUpTime.text = SetTimeVC.GlobalVariable.myString
        onOff.setOn(false, animated: true)

        do
        {
            let audioPath = Bundle.main.path(forResource: "1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            //ERROR
        }
    }
    
    @IBAction func alarmOnOff(_ sender: UISwitch) {
        if (sender.isOn == true){
            //set seconds var to however many seconds until alarm
            let currentDate = Date()
            seconds = SetTimeVC.GlobalVariable.myTime.timeIntervalSince(currentDate)
            if(seconds < 0) {
                SetTimeVC.GlobalVariable.myTime.addTimeInterval(86400.0)
            }
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(HomeViewController.counter), userInfo: nil, repeats: true)

        }
        else{
            //reset seconds to whatever
            timer.invalidate()
            seconds = 30
            
            audioPlayer.stop()
           
        }
    }
    
    
    @objc func counter()
    {
        seconds -= 1
        
        if (seconds <= 0)
        {
            timer.invalidate()
            audioPlayer.play()
        }
    }

    
    
}
