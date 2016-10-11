//
//  TriggerViewController.swift
//  ABSensorSDKDemo
//
//  Created by liaojinhua on 2016/9/27.
//  Copyright © 2016年 April Brother. All rights reserved.
//

import UIKit
import ABSensorSDK

class TriggerViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    private var trigger:ABTrigger?
    
    fileprivate var triggerManager = ABTriggerManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        triggerManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func startAction(_ sender: AnyObject) {
        if let _ = trigger {
            triggerManager.stopMonitoringForTriggerWith(identifier: trigger!.identifier)
        }
        
        // 生成两个规则
        // ABOrientationRule ：方向规则，当Sensor正面朝下的时候触发
        // ABMotionRule: 运动规则，true:当在运动是触发 fasle:静止时触发
        // identifier：是sensor的mac地址，一个规则只能应用于一个sensor，同一个sensor可以设置多个规则，但是不能有冲突，否则无法触发
        let rules = [ABOrientationRule.orientationEquals(orientation: .HorizontalUpsideDown, identifier: "12-3b-6a-1a-75-1e"),
                     ABMotionRule.motionEquals(state: true, identifier: "12-3b-6a-1a-75-1e")]
        // identifier:是用来唯一区分一个触发器的，一个触发器可以包含多个规则
        // 我们创建的这个触发是当sensor正面朝下且在运动的时候才会触发
        trigger = ABTrigger.init(rules: rules, identifier: "multiple trigger")
        triggerManager.startMonitoringForTrigger(trigger: trigger!)
    }
}

extension TriggerViewController:ABTriggerManagerDelegate {
    func triggerManager(manager: ABTriggerManager, triggerChangedState trigger: ABTrigger) {
        textView.text.append("trigger state changed：\(trigger.state)\n")
    }
}

