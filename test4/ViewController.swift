//
//  ViewController.swift
//  test4
//
//  Created by vishal kumar on 4/11/16.
//  Copyright © 2016 nextsapDev. All rights reserved.
//

import UIKit
import SpeechKit

class ViewController: UIViewController ,SKTransactionDelegate{
    
    @IBOutlet weak var statuslabel: UILabel!
   
    @IBOutlet weak var micicon: UIButton!
    var interval = 0.05;
    
    var timer:NSTimer?
    
    
    var Rstatus :Bool?
    @IBOutlet weak var Vollevel: UILabel!
    
    var voice : SKRecognition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        statuslabel.text = "press the mic"
        
        
        
    }
    func transactionDidBeginRecording(transaction: SKTransaction!) {
        
        print("recording started")
    
    
    }
    func transactionDidFinishRecording(transaction: SKTransaction!) {
        print("recording done")
    
    
    }
    func transaction(transaction: SKTransaction!, didReceiveRecognition recognition: SKRecognition!) {
        
        let topRecognitionText = recognition.text;
        print("did reciveve recognition")
        print(topRecognitionText)
    
    }
    func transaction(transaction: SKTransaction!, didReceiveServiceResponse response: [NSObject : AnyObject]!) {
    
        print("service responded")
    }
    func transaction(transaction: SKTransaction!, didFinishWithSuggestion suggestion: String!) {
        
        print("suggestion")
    }
    func transaction(transaction: SKTransaction!, didFailWithError error: NSError!, suggestion: String!) {
        print("error")
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    @IBAction func mictapped(sender: AnyObject) {
        
       
        
        
        statuslabel.text = "Started recording"
        let session = SKSession(URL: NSURL(string: SKSServerUrl), appToken: SKSAppKey)
        
        
        let transactionOne = session.recognizeWithType(SKTransactionSpeechTypeDictation,
            detection: .Long,
            language: "eng-USA",
            delegate: self)
        
        
        
        
        if transactionOne != nil{
            print("connection established ")
            print(transactionOne)
            
            
            func startPollingVolume() {
              timer = NSTimer.scheduledTimerWithTimeInterval(interval,
                target: self,
                selector: "pollVolume",
                userInfo: nil,
                repeats: true)
            }
            
            func pollVolume() {
                let volumeLevel:Float = transactionOne.audioLevel;
                print(volumeLevel)
                self.Vollevel.text = String(volumeLevel)
            }
            
            func stopPollingVolume() {
                timer!.invalidate()
            }
            

           
        }
        
    
       
        
        }
    
    
    
    @IBAction func stoptapped(sender: AnyObject) {
        
        statuslabel.text = "processing"
        
    }
    
    
   
    
}

