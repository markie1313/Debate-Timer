//
//  ViewController.swift
//  Debate Timer
//
//  Created by Mark Lindberg on 3/31/16.
//  Copyright © 2016 Phredster. All rights reserved.
//

import UIKit
import Foundation

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
    
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
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
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
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
        
        timerText.text = newTimer.updateStopwatch()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newTimer.minutes = 2
        newTimer.seconds = 60
        timerText.text = "3:00"
    }
    
}

class ViewControllerFirstNegPrep: UIViewController {
    var newTimer = StopWatch2(isNegPrep: true, isAffPrep: false)

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
        timerText.text = newTimer.updateStopwatch()
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
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)

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
        
        var negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
        var negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
        newTimer.minutes = 7
        newTimer.seconds = 60

        print("\(negPrepMin):\(negPrepSec)")
    }
    

    
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
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
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)

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
        timerText.text = newTimer.updateStopwatch()
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
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: true)
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTimer.minutes = 4
        newTimer.seconds = 60
        
    }

    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
}

class viewController2AC: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
   
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
        
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
   
}

class ViewController3CX: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 2
    var timerLable: String = "3:00"
    
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
            newTimer.minutes = timerMinutes
            newTimer.stopWatchString = timerLable
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
                    self.newTimer.minutes = self.timerMinutes
                    self.newTimer.stopWatchString = self.timerLable
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
        
        newTimer.minutes = timerMinutes
        newTimer.seconds = 60
        
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
}

class ViewControllerNegPrep2: UIViewController {
    var negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
    var negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
   var newTimer = StopWatch2(isNegPrep: true, isAffPrep: false)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
// for a reset, need to store the original prep time left
    var originalPrepMin: Int = 4
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setTitle("Stop", forState: .Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setTitle("Start", forState: .Normal)
            
        }
   }
    
    @IBAction func resetTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = timerMinutes
            newTimer.stopWatchString = timerLabel
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
                    self.newTimer.minutes = self.timerMinutes
                    self.newTimer.stopWatchString = self.timerLabel
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
        originalPrepMin = Int(negPrepMin as! String)!
        originalPrepSec = Int(negPrepSec as! String)!
        timerText.text = "\(negPrepMin):\(negPrepSec)"
        newTimer.minutes = Int(negPrepMin as! String)!
        newTimer.seconds = Int(negPrepSec as! String)!
        
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
}

class ViewController2NC: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 7
    var timerLabel: String = "8:00"
  
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setTitle("Stop", forState: .Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setTitle("Start", forState: .Normal)
            
        }
   }
    
    @IBAction func resetTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = timerMinutes
            newTimer.stopWatchString = timerLabel
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
                    self.newTimer.minutes = self.timerMinutes
                    self.newTimer.stopWatchString = self.timerLabel
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
        timerText.text = timerLabel
        newTimer.minutes = timerMinutes
        newTimer.seconds = 60
        
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
    
}

class ViewController4CX: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 2
    var timerLabel: String = "3:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setTitle("Stop", forState: .Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setTitle("Start", forState: .Normal)
            
        }
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = timerMinutes
            newTimer.stopWatchString = timerLabel
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
                    self.newTimer.minutes = self.timerMinutes
                    self.newTimer.stopWatchString = self.timerLabel
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
        timerText.text = timerLabel
        newTimer.minutes = timerMinutes
        newTimer.seconds = 60
        
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
}