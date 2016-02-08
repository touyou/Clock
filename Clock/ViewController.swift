//
//  ViewController.swift
//  Clock
//
//  Created by 藤井陽介 on 2016/01/31.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

@objc
class ViewController: UIViewController {

    // hoge1はhogeの10の位,hoge2はhogeの1の位
    @IBOutlet var hour1: UIImageView!
    @IBOutlet var hour2: UIImageView!
    @IBOutlet var min1: UIImageView!
    @IBOutlet var min2: UIImageView!
    @IBOutlet var sec1: UIImageView!
    @IBOutlet var sec2: UIImageView!
    var numberArray: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberArray = [UIImage(named: "0.png")!,
            UIImage(named: "1.png")!,
            UIImage(named: "2.png")!,
            UIImage(named: "3.png")!,
            UIImage(named: "4.png")!,
            UIImage(named: "5.png")!,
            UIImage(named: "6.png")!,
            UIImage(named: "7.png")!,
            UIImage(named: "8.png")!,
            UIImage(named: "9.png")!
        ]
        nowTime()
        NSTimer.scheduledTimerWithTimeInterval(1/60, target: self, selector:"nowTime", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 変換関数、カレンダーからとった時刻情報は二桁の数字になるのでそれを一桁ずつ扱えるようにする
    func convert(n: Int) -> [Int] {
        return [n/10, n%10]
    }
    
    // 時刻更新のための関数
    func nowTime() {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        // この下のcomponentsの書き方はSwift2.0から
        let components = calendar.components([.Hour,.Minute,.Second],fromDate: date)
        var hour = convert(components.hour)
        var min = convert(components.minute)
        var sec = convert(components.second)
        hour1.image = numberArray[hour[0]]
        hour2.image = numberArray[hour[1]]
        min1.image = numberArray[min[0]]
        min2.image = numberArray[min[1]]
        sec1.image = numberArray[sec[0]]
        sec2.image = numberArray[sec[1]]
    }
}

