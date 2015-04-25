//
//  ViewController.swift
//  PhraseThrow
//
//  Created by Tianyu Xu on 15/3/21.
//  Copyright (c) 2015年 Tianyu Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeInterval: NSTimeInterval = 0.01
    let timeThreshold: Double = 5
    let epsilon: Double = 0.001
    
    var nounDict: NounDictionary!
    var currTime: Double?
    var timer: NSTimer?
    
    @IBOutlet var timeBar: UIProgressView!
    @IBOutlet var nextWordLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    @IBAction func nextWordButton(sender: UIButton) {
        currTime = 0
        updateWord()
        
        if (timer == nil) {
            timeBar.hidden = false
            timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        }
    }
    
    func updateWord() {
        var word: String? = nounDict.randomWord()
        if word != nil {
            self.nextWordLabel.text = word!.capitalizedString
        }
    }
    
    func updateTimer() {
        currTime! += timeInterval
        if timeThreshold - currTime! < epsilon {
            updateWord()
            currTime = 0;
        }
        timeBar.setProgress(Float(currTime! / 5), animated: false)
        timeLabel.text = String(format:"Answer in %.1fs!", 5 - currTime!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nounDict = NounDictionary()
        self.nextWordLabel.text = "Press the button!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

