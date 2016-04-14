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
    
    var newTimer = StopWatch2()
    @IBOutlet var timerText: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func resetTimer(sender: AnyObject) {
    
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = 7
            newTimer.stopWatchString = "8:00"
            timerText.text = newTimer.stopWatchString
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setTitle("Start", forState: .Normal)

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
                    self.newTimer.seconds = 60
                    self.newTimer.minutes = 7
                    self.newTimer.stopWatchString = "8:00"
                    self.timerText.text = self.newTimer.stopWatchString
                    self.newTimer.timer.invalidate()
                    self.newTimer.startStopwatch = true
                    self.startStopButton.setTitle("Start", forState: .Normal)
            })
            
            alertController!.addAction(firstAction)
            alertController!.addAction(secondAction)
            self.presentViewController(alertController!,
                animated: true,
                completion: nil)
        }
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
    
    
    //Now, I’m going to have to add parameters to updateStopwatch so I can do the different times.
    //Actually, it looks good - all it does is update the existing values
    func updateStopwatch() {
        
            timerText.text = newTimer.updateStopwatch()
   
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newTimer.minutes = 7
        newTimer.seconds = 60
        timerText.text = "8:00"
    }
  
    /*
  I will want to use this to do a transition to the next page - i.e. do you want to go to the next page if the timer is running?  
    func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        <#code#>
    }
*/
}

class ViewController1CX: UIViewController {
    var newTimer = StopWatch()
    @IBOutlet var timerText: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStop(sender: AnyObject) {
        
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
    
    
    @IBAction func resetTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = 2
            newTimer.stopWatchString = "3:00"
            timerText.text = newTimer.stopWatchString
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setTitle("Start", forState: .Normal)
            
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
                    self.newTimer.seconds = 60
                    self.newTimer.minutes = 2
                    self.newTimer.stopWatchString = "3:00"
                    self.timerText.text = self.newTimer.stopWatchString
                    self.newTimer.timer.invalidate()
                    self.newTimer.startStopwatch = true
                    self.startStopButton.setTitle("Start", forState: .Normal)
            })
            
            alertController!.addAction(firstAction)
            alertController!.addAction(secondAction)
            self.presentViewController(alertController!,
                animated: true,
                completion: nil)
        }
    }
    
    func updateStopwatch() {
        
        newTimer.seconds -= 1
        
        if newTimer.seconds == 0 && newTimer.minutes == 0 {
            
            newTimer.timer.invalidate()
            timerText.text = "0:00"
            return
            
        }
        
        if newTimer.seconds == 0 {
            
            timerText.text = "\(newTimer.minutes):00"
            print(timerText.text)
            newTimer.minutes -= 1
            newTimer.seconds = 60
            
        }
        
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
        newTimer.minutes = 2
        newTimer.seconds = 60
    }
    
}


class ViewControllerFirstNegPrep: UIViewController {
    var newTimer = StopWatch()

    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setTitle("Stop", forState: .Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            var negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
            var negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!

            print("\(negPrepMin):\(negPrepSec)")
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setTitle("Start", forState: .Normal)
            
        }
    }
    
    
    @IBAction func resetTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = 4
            newTimer.stopWatchString = "5:00"
            timerText.text = newTimer.stopWatchString
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setTitle("Start", forState: .Normal)
            
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
                    self.newTimer.seconds = 60
                    self.newTimer.minutes = 4
                    self.newTimer.stopWatchString = "5:00"
                    self.timerText.text = self.newTimer.stopWatchString
                    self.newTimer.timer.invalidate()
                    self.newTimer.startStopwatch = true
                    self.startStopButton.setTitle("Start", forState: .Normal)
            })
            
            alertController!.addAction(firstAction)
            alertController!.addAction(secondAction)
            self.presentViewController(alertController!,
                animated: true,
                completion: nil)
        }
    }
    
    func updateStopwatch() {
        
        newTimer.seconds -= 1
        
        if newTimer.seconds == 0 && newTimer.minutes == 0 {
            
            newTimer.timer.invalidate()
            timerText.text = "0:00"
            return
            
        }
        
        if newTimer.seconds == 0 {
            
            timerText.text = "\(newTimer.minutes):00"
            print(timerText.text)
            newTimer.minutes -= 1
            newTimer.seconds = 60
            
        }
        
        var secondsString = newTimer.seconds > 9 ? "\(newTimer.seconds)" : "0\(newTimer.seconds)"
        var minutesString = newTimer.minutes > 9 ? "\(newTimer.minutes)" : "\(newTimer.minutes)"
        
        if newTimer.seconds == 60 {
            
            secondsString = "00"
            minutesString = "\(newTimer.minutes + 1)"
            
        }
        
        NSUserDefaults.standardUserDefaults().setObject(newTimer.minutes, forKey: "negPrepMin")
        NSUserDefaults.standardUserDefaults().setObject(newTimer.seconds, forKey: "negPrepSec")
        newTimer.stopWatchString = "\(minutesString):\(secondsString)"
        timerText.text = newTimer.stopWatchString
        print(newTimer.stopWatchString)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newTimer.minutes = 4
        newTimer.seconds = 60
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "segue1NC" {
            if newTimer.startStopwatch == false {
                var alert:UIAlertController?
                alert = UIAlertController(title: "Timer Running", message: "Please stop Neg prep time.", preferredStyle: .Alert)
                
                let firstAction = UIAlertAction(title: "OK",
                    style: UIAlertActionStyle.Cancel,
                    handler: nil
                )
                
                alert!.addAction(firstAction)
                self.presentViewController(alert!,
                    animated: true,
                    completion: nil)
                
            } else {
                return true
            }
        }
        return true
    }
}


class ViewController1NC: UIViewController {
    var newTimer = StopWatch()

    @IBOutlet var timerText: UILabel!
    
    @IBOutlet var startStopButton: UIButton!
    
    
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
    
    @IBAction func resetTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = 7
            newTimer.stopWatchString = "8:00"
            timerText.text = newTimer.stopWatchString
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setTitle("Start", forState: .Normal)
            
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
                    self.newTimer.seconds = 60
                    self.newTimer.minutes = 7
                    self.newTimer.stopWatchString = "8:00"
                    self.timerText.text = self.newTimer.stopWatchString
                    self.newTimer.timer.invalidate()
                    self.newTimer.startStopwatch = true
                    self.startStopButton.setTitle("Start", forState: .Normal)
            })
            
            alertController!.addAction(firstAction)
            alertController!.addAction(secondAction)
            self.presentViewController(alertController!,
                animated: true,
                completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTimer.minutes = 7
        newTimer.seconds = 60
        var negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
        var negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!

        print(negPrepMin)
    }
    

    
    
    func updateStopwatch() {
        
        newTimer.seconds -= 1
        
        if newTimer.seconds == 0 && newTimer.minutes == 0 {
            
            newTimer.timer.invalidate()
            timerText.text = "0:00"
            return
            
        }
        
        if newTimer.seconds == 0 {
            
            timerText.text = "\(newTimer.minutes):00"
            print(timerText.text)
            newTimer.minutes -= 1
            newTimer.seconds = 60
            
        }
        
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "segue2CX" {
            if newTimer.startStopwatch == false {
                var alert:UIAlertController?
                alert = UIAlertController(title: "Timer Running", message: "Please stop the timer.", preferredStyle: .Alert)
                
                let firstAction = UIAlertAction(title: "OK",
                    style: UIAlertActionStyle.Cancel,
                    handler: nil
                )
                
                alert!.addAction(firstAction)
                self.presentViewController(alert!,
                    animated: true,
                    completion: nil)
                
            } else {
                return true
            }
        }
        return true
    }

}

class ViewController2CX: UIViewController {
    var newTimer = StopWatch()

    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
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
    @IBAction func resetTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = 2
            newTimer.stopWatchString = "3:00"
            timerText.text = newTimer.stopWatchString
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setTitle("Start", forState: .Normal)
            
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
                    self.newTimer.seconds = 60
                    self.newTimer.minutes = 2
                    self.newTimer.stopWatchString = "3:00"
                    self.timerText.text = self.newTimer.stopWatchString
                    self.newTimer.timer.invalidate()
                    self.newTimer.startStopwatch = true
                    self.startStopButton.setTitle("Start", forState: .Normal)
            })
            
            alertController!.addAction(firstAction)
            alertController!.addAction(secondAction)
            self.presentViewController(alertController!,
                animated: true,
                completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTimer.minutes = 2
        newTimer.seconds = 60
        
    }
 
    func updateStopwatch() {
        
        newTimer.seconds -= 1
        
        if newTimer.seconds == 0 && newTimer.minutes == 0 {
            
            newTimer.timer.invalidate()
            timerText.text = "0:00"
            return
            
        }
        
        if newTimer.seconds == 0 {
            
            timerText.text = "\(newTimer.minutes):00"
            print(timerText.text)
            newTimer.minutes -= 1
            newTimer.seconds = 60
            
        }
        
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

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "segue1AffPrep" {
            if newTimer.startStopwatch == false {
                var alert:UIAlertController?
                alert = UIAlertController(title: "Timer Running", message: "Please stop the timer.", preferredStyle: .Alert)
                
                let firstAction = UIAlertAction(title: "OK",
                    style: UIAlertActionStyle.Cancel,
                    handler: nil
                )
                
                alert!.addAction(firstAction)
                self.presentViewController(alert!,
                    animated: true,
                    completion: nil)
                
            } else {
                return true
            }
        }
        return true
    }
    
}


class ViewController1AffPrep: UIViewController {
    var newTimer = StopWatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTimer.minutes = 4
        newTimer.seconds = 60
        
    }
   
//    NSUserDefaults.standardUserDefaults().setObject(newTimer.minutes, forKey: "affPrepMin")
//    NSUserDefaults.standardUserDefaults().setObject(newTimer.seconds, forKey: "affPrepSec")
   
}