//
//  StartViewController.swift
//  Wanpo
//
//  Created by 久保田慧 on 2018/12/15.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit
import CoreMotion

class StartViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var dogStepCountLabel: UILabel!
    var timer:Timer?
    var timerSec:Float = 0
    
    // class wide constant !!
    let pedometer = CMPedometer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startTimeLabel.text = "お散歩開始時刻：\(getTimeString())"
        
    }
    
    
    func getTimeString() -> String{
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date as Date) 
    }
    
    @IBAction func handleCameraButton(_ sender: Any) {
        //カメラを指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //歩数計スタート
        stepCounter()
    }
    
    
    func stepCounter(){
        // class wide constant !!
        
        
        // CMPedometerの確認
        if(CMPedometer.isStepCountingAvailable()){
            
            self.pedometer.startUpdates(from: NSDate() as Date) {
                (data: CMPedometerData?, error) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        // 歩数 NSNumber?
                        let steps = data!.numberOfSteps
                        var results:String = String(format:"飼い主さん: %d歩", steps.intValue)
                        results += "\n"
                                                    // 距離 NSNumber?
                                                    let distance = data!.distance!.doubleValue
                                                    results += String(format: "距離: %dm", Int(distance))
                                                    results += "\n"
                        
//                                                    // 期間
//                                                    let period = data!.endDate.timeIntervalSince(data!.startDate)
//                                                    // スピード
//                                                    let speed = distance / period
//                                                    results += String(format: "speed: %f", speed)
//                                                    results += "\n"
//
//                                                    // 平均ペース NSNumber?
//                                                    let averageActivePace = data!.averageActivePace
//                                                    results += String(format: "averageActivePace: %f", averageActivePace!.doubleValue)
//                                                    results += "\n"
//
//                                                    // ペース NSNumber?
//                                                    let currentPace = data!.currentPace
//                                                    results += String(format: "currentPace: %f", currentPace!.doubleValue)
//                                                    results += "\n"
//
//                                                    // リズム steps/second NSNumber?
//                                                    let currentCadence = data!.currentCadence
//                                                    results += String(format: "currentCadence: %f", currentCadence!.doubleValue)
//                                                    results += "\n"
//
//                                                    // 昇ったフロアの数 NSNumber?
//                                                    let floorsAscended = data!.floorsAscended
//                                                    results += String(format: "floorsAscended: %d", floorsAscended!.intValue)
//                                                    results += "\n"
//
//                                                    // 降りたフロアの数 NSNumber?
//                                                    let floorsDescended = data!.floorsDescended
//                                                    results += String(format: "floorsDescended: %d", floorsDescended!.intValue)
//                                                    results += "\n"
                        
                        // ライン数
                        self.stepCountLabel.numberOfLines = 10
                        
                        self.stepCountLabel.text = results
                        print(results)
                        
                        print("型名")
                        print(type(of: steps))
                        let dogSteps = round(Double(steps)*6.3)
                        self.dogStepCountLabel.text = String("◯◯ちゃん：\(dogSteps)歩")
                        //                        var dogResults:String = String(format:"◯◯ちゃん: %d歩", dogSteps.intValue)
                        
                        //                        let steps = data!.numberOfSteps
                        //                        var results:String = String(format:"飼い主さん: %d歩", steps.intValue)
                        //                        results += "\n"
                        
                    }
                    
                })
            }
        }
    }
    
    
    
}
