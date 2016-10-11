//
//  SensorViewController.swift
//  ABSensorSDKDemo
//
//  Created by liaojinhua on 2016/9/21.
//  Copyright © 2016年 April Brother. All rights reserved.
//

import UIKit
import ABSensorSDK

class SensorViewController: UITableViewController {
    
    private var sensorManager:ABSensorManager?
    fileprivate var sensors = [ABSensor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        sensorManager = ABSensorManager.init(delegate: self)
        sensorManager?.startMonitoringForIdentifier(identifier: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SensorViewController:ABSensorManagerDelegate {
    func sensorManager(manager: ABSensorManager, didMonitoredSensor sensor: ABSensor) {
        if !sensors.contains(sensor) {
            sensors.append(sensor)
        }
        self.tableView.reloadData()
    }
    
    func sensorManager(manager: ABSensorManager, didMonitoredForIdentifier: String, sensor: ABSensor) {
        
    }
}


extension SensorViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sensors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SensorCell", for: indexPath)
        
        let sensor = sensors[indexPath.row]
        let name = sensor.name + "\n"
        let info = "mac:\(sensor.macAddress) rssi:\(sensor.rssi) x:\(sensor.xAcceleration) y:\(sensor.yAcceleration) z:\(sensor.zAcceleration) battery:\(sensor.battery) isMotion:\(sensor.isMotion) currentMotionTime:\(sensor.currentMotionTime) lastMotionTime:\(sensor.lastMotionTime)"
        
        let attributeString = NSMutableAttributedString()
        var attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName:UIColor.black]
        attributeString.append(NSAttributedString.init(string: name, attributes: attributes))
        
        attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName:UIColor.darkGray]
        attributeString.append(NSAttributedString.init(string: info, attributes: attributes))
        
        cell.textLabel?.attributedText = attributeString
        return cell
    }
}
