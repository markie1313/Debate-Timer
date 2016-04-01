//
//  StopWatch.swift
//  dTimer
//
//  Created by Mark Lindberg on 3/30/16.
//  Copyright © 2016 Phredster. All rights reserved.
//

import Foundation


class StopWatch {
    

var laps: [String] = []

var timer = NSTimer()

var minutes: Int = 0
var seconds: Int = 0
var fractions: Int = 0

var stopWatchString: String = ""

var startStopwatch: Bool = true

    
var stopWatchlabel: String = ""

var startStopButton: String = ""

var lapResetButton: String = ""


 func startStop(sender: AnyObject) {
    
    if startStopwatch == true {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
        
        startStopwatch = false
        
        startStopButton = "Stop"
        //lapResetButton = "Lap"
        
        // if the button had an image, we would do:
        
        //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
        
        
    } else {
        
        timer.invalidate()
        
        startStopwatch = true
        
        // If I was using an image for the button, I would maybe change it here...
        
        startStopButton = "Start"
        lapResetButton = "Reset"
        
        
    }
    
}

func updateStopwatch() {
    
    fractions += 1
    
    if fractions == 100 {
        
        seconds += 1
        fractions = 0
        
    }
    
    if seconds == 60 {
        
        minutes += 1
        seconds = 0
        
    }
    
    let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
    let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
    let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
    
    stopWatchString = "\(minutesString):\(secondsString):\(fractionsString)"
    stopWatchlabel = stopWatchString
    
    //print(stopWatchString)
    
}


}
