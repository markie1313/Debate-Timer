//
//  ViewController.swift
//  Debate Timer
//
//  Created by Mark Lindberg on 3/31/16.
//  Copyright © 2016 Phredster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class ViewController1AC: UIViewController {
    
    var newTimer = StopWatch()
    
    @IBOutlet var timerText: UILabel!
    
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var startStopButton: UIButton!
    
    
    @IBAction func resetTimer(sender: AnyObject) {
        
        newTimer.seconds = 60
        newTimer.minutes = 7
        
        newTimer.stopWatchString = "8:00"
        timerText.text = newTimer.stopWatchString
        newTimer.timer.invalidate()
        
        newTimer.startStopwatch = true

    }
    
    @IBAction func startStopTimer(sender: AnyObject) {
        
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
            
            newTimer.startStopwatch = false
            
            startStopButton.setTitle("Stop", forState: .Normal)
            
            
            // if the button had an image, we would do:
            
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
            
        } else {
            
            newTimer.timer.invalidate()
            
            newTimer.startStopwatch = true
            
            // If I was using an image for the button, I would maybe change it here...
            
            startStopButton.setTitle("Start", forState: .Normal)
            
            
        }

    }
    
    
    
    func updateStopwatch() {
        
            newTimer.seconds -= 1
        
        if newTimer.seconds == 0 {
            
            timerText.text = "\(newTimer.minutes):00"
            print(timerText.text)

            newTimer.minutes -= 1
            newTimer.seconds = 60
            
        }

      //  let fractionsString = newTimer.fractions > 9 ? "\(newTimer.fractions)" : "0\(newTimer.fractions)"
        var secondsString = newTimer.seconds > 9 ? "\(newTimer.seconds)" : "0\(newTimer.seconds)"
        var minutesString = newTimer.minutes > 9 ? "\(newTimer.minutes)" : "\(newTimer.minutes)"
        if newTimer.seconds == 60 {
            
            secondsString = "00"
            minutesString = "\(newTimer.minutes + 1)"
            
        }
            newTimer.stopWatchString = "\(minutesString):\(secondsString)"
            timerText.text = newTimer.stopWatchString
        
        print(newTimer.stopWatchString)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newTimer.minutes = 7
        newTimer.seconds = 60
    }

}



