//
//  ViewController.swift
//  MyClock
//
//  Created by 程飞 on 15/10/10.
//  Copyright © 2015年 cheng.fei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var hourHand: UIImageView!
    @IBOutlet weak var minuteHand: UIImageView!
    @IBOutlet weak var secondHand: UIImageView!
    var timer:NSTimer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hourHand.layer.anchorPoint = CGPointMake(0.5, 0.7)
        minuteHand.layer.anchorPoint = CGPointMake(0.5, 0.7)
        secondHand.layer.anchorPoint = CGPointMake(0.5, 0.7)

        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.tick), userInfo: nil, repeats: true)
        
        //初始化 ,第一秒开始就跑起来
        self.tick()
        
    }
    
    func tick() {
    //convert timer to hour minute and second
        let calender = NSCalendar.init(calendarIdentifier: NSCalendarIdentifierGregorian)
        let currentDate = NSDate()
        let hourComponents = calender!.components(NSCalendarUnit.Hour , fromDate: currentDate)
        let minuteComponents = calender!.components(NSCalendarUnit.Minute , fromDate: currentDate)
        let secondComponents:NSDateComponents = calender!.components(NSCalendarUnit.Second , fromDate: currentDate)
        
        
        let hoursAngle:Double = Double(Double(hourComponents.hour) / 12.0) * (M_PI * 2.0)
        let minutesAngle:Double = Double(Double(minuteComponents.minute) / 60.0) * (M_PI * 2.0)
        let secondsAngele:Double = Double(Double(secondComponents.second) / 60.0) * (M_PI * 2.0)
        print("\(hourComponents.hour):\(minuteComponents.minute):\(secondComponents.second)")
        hourHand.transform = CGAffineTransformMakeRotation(CGFloat(hoursAngle))
        minuteHand.transform = CGAffineTransformMakeRotation(CGFloat(minutesAngle))
        secondHand.transform = CGAffineTransformMakeRotation(CGFloat(secondsAngele))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

