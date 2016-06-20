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
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    @IBAction func resetTimer(sender: AnyObject) {
        
        if newTimer.startStopwatch == true {
            
            newTimer.seconds = 60
            newTimer.minutes = 7
            newTimer.stopWatchString = "8:00"
            timerText.text = newTimer.stopWatchString
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            //            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goBack" || identifier == "goNext" {
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

class ViewController1CX: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    @IBOutlet var timerText: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStop(sender: AnyObject) {
        
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            //            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueFirstNegPrep" {
            let svc = segue.destinationViewController as! ViewControllerFirstNegPrep
            svc.isNew = "yes"
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segueFirstNegPrep" {
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

class ViewControllerFirstNegPrep: UIViewController {
    var newTimer = StopWatch2(isNegPrep: true, isAffPrep: false)
    var isNew: String! = ""
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
            let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
            
            print("\(negPrepMin):\(negPrepSec)")
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        
        if isNew == "yes" {
            newTimer.minutes = 4
            newTimer.seconds = 60
        } else {
            let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
            let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
            newTimer.minutes = Int(negPrepMin as! String)!
            newTimer.seconds = Int(negPrepSec as! String)!
            timerText.text = "\(negPrepMin):\(negPrepSec)"
        }
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue1NC" {
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
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            //            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        
        let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
        let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
        newTimer.minutes = 7
        newTimer.seconds = 60
        
        print("\(negPrepMin):\(negPrepSec)")
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue2CX" {
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
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            //            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue1AffPrep" {
            let svc = segue.destinationViewController as! ViewController1AffPrep
            svc.isNew = "yes"
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue1AffPrep" {
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
    var isNew: String! = ""
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            //            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        if isNew == "yes" {
            newTimer.minutes = 4
            newTimer.seconds = 60
        } else {
            let affPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("affPrepMin")!
            let affPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("affPrepSec")!
            newTimer.minutes = Int(affPrepMin as! String)!
            newTimer.seconds = Int(affPrepSec as! String)!
            timerText.text = "\(affPrepMin):\(affPrepSec)"
            
        }
        
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue2AC" {
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

class viewController2AC: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            //            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue3CX" {
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

class ViewController3CX: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 2
    var timerLable: String = "3:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            // if the button had an image, we would do:
            //startStopButton.setImage(UIImage(named: "whatever.jpt", forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            // If I was using an image for the button, I would maybe change it here...
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            //            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue2NegPrep" {
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

class ViewControllerNegPrep2: UIViewController {
    let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
    let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
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
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue2NC" {
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

class ViewController2NC: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 7
    var timerLabel: String = "8:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue4CX" {
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

class ViewController4CX: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 2
    var timerLabel: String = "3:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue3NegPrep" {
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

class ViewControllerNegPrep3: UIViewController {
    let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
    let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
    var newTimer = StopWatch2(isNegPrep: true, isAffPrep: false)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    var originalPrepMin: Int = 4
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue1NR" {
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

class ViewController1NR: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue2AffPrep" {
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

class ViewControllerAffPrep2: UIViewController {
    let affPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("affPrepMin")!
    let affPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("affPrepSec")!
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: true)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    var originalPrepMin: Int = 4
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        originalPrepMin = Int(affPrepMin as! String)!
        originalPrepSec = Int(affPrepSec as! String)!
        timerText.text = "\(affPrepMin):\(affPrepSec)"
        newTimer.minutes = Int(affPrepMin as! String)!
        newTimer.seconds = Int(affPrepSec as! String)!
        
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue1AR" {
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

class ViewController1AR: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue4NegPrep" {
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

class ViewControllerNegPrep4: UIViewController {
    let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
    let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
    var newTimer = StopWatch2(isNegPrep: true, isAffPrep: false)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    var originalPrepMin: Int = 4
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue2NR" {
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

class ViewController2NR: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var timerText: UILabel!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue3AffPrep" {
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

class ViewControllerAffPrep3: UIViewController {
    let affPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("affPrepMin")!
    let affPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("affPrepSec")!
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: true)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    var originalPrepMin: Int = 4
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
            
        } else {
            
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        originalPrepMin = Int(affPrepMin as! String)!
        originalPrepSec = Int(affPrepSec as! String)!
        timerText.text = "\(affPrepMin):\(affPrepSec)"
        newTimer.minutes = Int(affPrepMin as! String)!
        newTimer.seconds = Int(affPrepSec as! String)!
        
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "segue2AR" {
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

class ViewController2AR: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" {
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

class ViewControllerLDAC: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 5
    var timerLabel: String = "6:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLD1CX: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 2
    var timerLabel: String = "3:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goNext" {
            let svc = segue.destinationViewController as! ViewControllerLDNegPrep1
            svc.isNew = "yes"
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLDNegPrep1: UIViewController {
    let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
    let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
    var newTimer = StopWatch2(isNegPrep: true, isAffPrep: false)
    var isNew: String! = ""
    var timerMinutes: Int = 2
    var timerLabel: String = "3:00"
    var originalPrepMin: Int = 2
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        if isNew == "yes" {
            newTimer.minutes = 2
            newTimer.seconds = 60
        } else {
            let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
            let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
            newTimer.minutes = Int(negPrepMin as! String)!
            newTimer.seconds = Int(negPrepSec as! String)!
            timerText.text = "\(negPrepMin):\(negPrepSec)"
        }
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLDNC: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 6
    var timerLabel: String = "7:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLD2CX: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 2
    var timerLabel: String = "3:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goNext" {
            let svc = segue.destinationViewController as! ViewControllerLDAffPrep1
            svc.isNew = "yes"
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLDAffPrep1: UIViewController {
    let affPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("affPrepMin")!
    let affPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("affPrepSec")!
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: true)
    var isNew : String! = ""
    var timerMinutes: Int = 2
    var timerLabel: String = "3:00"
    var originalPrepMin: Int = 2
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        if isNew == "yes" {
            newTimer.minutes = 2
            newTimer.seconds = 60
        } else {
            let affPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("affPrepMin")!
            let affPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("affPrepSec")!
            newTimer.minutes = Int(affPrepMin as! String)!
            newTimer.seconds = Int(affPrepSec as! String)!
            timerText.text = "\(affPrepMin):\(affPrepSec)"
        }
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLDAR1: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 3
    var timerLabel: String = "4:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLDNegPrep2: UIViewController {
    let negPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("negPrepMin")!
    let negPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("negPrepSec")!
    var newTimer = StopWatch2(isNegPrep: true, isAffPrep: false)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    var originalPrepMin: Int = 4
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLDNR: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 5
    var timerLabel: String = "6:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLDAffPrep2: UIViewController {
    let affPrepMin = NSUserDefaults.standardUserDefaults().objectForKey("affPrepMin")!
    let affPrepSec = NSUserDefaults.standardUserDefaults().objectForKey("affPrepSec")!
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: true)
    var timerMinutes: Int = 4
    var timerLabel: String = "5:00"
    var originalPrepMin: Int = 4
    var originalPrepSec: Int = 60
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
            
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
        originalPrepMin = Int(affPrepMin as! String)!
        originalPrepSec = Int(affPrepSec as! String)!
        timerText.text = "\(affPrepMin):\(affPrepSec)"
        newTimer.minutes = Int(affPrepMin as! String)!
        newTimer.seconds = Int(affPrepSec as! String)!
    }
    
    func updateStopwatch() {
        timerText.text = newTimer.updateStopwatch()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

class ViewControllerLDAR2: UIViewController {
    var newTimer = StopWatch2(isNegPrep: false, isAffPrep: false)
    var timerMinutes: Int = 2
    var timerLabel: String = "3:00"
    
    @IBOutlet var timerText: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    @IBAction func startStopTimer(sender: AnyObject) {
        if newTimer.startStopwatch == true {
            newTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController1AC.updateStopwatch), userInfo: nil, repeats: true)
            newTimer.startStopwatch = false
            startStopButton.setImage(UIImage(named:"private-sign.png"), forState: UIControlState.Normal)
        } else {
            newTimer.timer.invalidate()
            newTimer.startStopwatch = true
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
            startStopButton.setImage(UIImage(named:"go.png"), forState: UIControlState.Normal)
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
                                                self.startStopButton.setImage(UIImage(named:"go.png"), forState: .Normal)
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goHome" || identifier == "goBack" || identifier == "goNext" {
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

