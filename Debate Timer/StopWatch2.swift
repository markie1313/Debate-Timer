//
//  StopWatch2.swift
//  Debate Timer
//
//  Created by Mark Lindberg on 4/4/16.
//  Copyright © 2016 Phredster. All rights reserved.
//

import Foundation
import UIKit


class StopWatch2 : NSObject {
    
    var startStopButtonExt: String = ""
    var labelText: String = ""
    var clockValue: Int = 0
    
    
    var timer = NSTimer()
    
    var minutes: Int = 0
    var seconds: Int = 60
    var fractions: Int = 0
    
    
    var startStopwatch: Bool = true
    
    var stopWatchString: String = ""
    var stopWatchlabel: String = ""
    var startStopButton: String = ""
    
    
    func startStop() {
        
        if startStopwatch == true {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
            startStopwatch = false
            startStopButtonExt = "Stop"
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)

        } else {
            
            timer.invalidate()
            startStopwatch = true
            startStopButtonExt = "Start"
            
        }
        
    }
    
    func updateStopwatch() -> String {
        seconds -= 1
        
        if seconds == 0 && minutes == 0 {
            timer.invalidate()
            labelText = "0:00"
            return self.labelText
        }

        if seconds == 0 {
            labelText = "\(minutes):00"
            print(labelText)
            minutes -= 1
            seconds = 60
        }

        var secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        var minutesString = minutes > 9 ? "\(minutes)" : "\(minutes)"
        
        if seconds == 60 {
            secondsString = "00"
            minutesString = "\(minutes + 1)"
        }
        
        stopWatchString = "\(minutesString):\(secondsString)"
        labelText = stopWatchString
        print("\(stopWatchString) test")
        return self.stopWatchString
// I think this is it - I have to return a value
    }
    
    
    func resetStopwatch(sender: AnyObject) {
        
        if startStopwatch == true {
            
            seconds = 60
            minutes = clockValue
            
            stopWatchString = "\(clockValue):00"
            labelText = stopWatchString
            timer.invalidate()
            
            startStopwatch = true
            
            startStopButtonExt = "Start"
            
        } else {
            
            var alertController:UIAlertController?
            alertController = UIAlertController(title: "Alert",
                message: "Are you sure you want to reset?",
                preferredStyle: .Alert)
            
            let firstAction = UIAlertAction(title: "No",
                style: UIAlertActionStyle.Cancel,
                handler: nil
            )
            
            let secondAction = UIAlertAction(title: "Yes",
                style: UIAlertActionStyle.Default,
                handler: {(paramAction:UIAlertAction!) in
                    self.seconds = 60
                    self.minutes = self.clockValue - 1
                    
                    self.stopWatchString = "\(self.clockValue):00"
                    self.labelText = self.stopWatchString
                    self.timer.invalidate()
                    
                    self.startStopwatch = true
                    
                    self.startStopButtonExt = "Start"
            })
            
            alertController!.addAction(firstAction)
            alertController!.addAction(secondAction)
            //            self.presentViewController(alertController!,
            //                animated: true,
            //                completion: nil)
        }
        
    }
    
}
