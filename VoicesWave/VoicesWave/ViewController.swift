//
//  ViewController.swift
//  VoicesWave
//
//  Created by XB on 2017/1/16.
//  Copyright © 2017年 Miu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var  recorder:AudioRecorder?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dir = NSString(string: NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true).first!)
        let path = dir.appendingPathComponent("memo.caf")
        recorder = AudioRecorder.init(fileURLWithPath: path)
    }
    
    
    @IBAction func recordBtnOnClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setTitle("stopRecord", for: .normal)
            recorder?.startRecord()
        }else{
            sender.setTitle("startRecord", for: .normal)
            recorder?.stopRecord()
        }
    }
    
    
}



