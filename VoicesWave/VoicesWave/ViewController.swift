//
//  ViewController.swift
//  VoicesWave
//
//  Created by XB on 2017/1/16.
//  Copyright © 2017年 Miu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var recorder:AudioRecorder?
    var timer:CADisplayLink?

    @IBOutlet weak var waveView: VoiceWaveView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dir = NSString(string: NSTemporaryDirectory())
        let path = dir.appendingPathComponent("memo.caf")
        recorder = AudioRecorder.init(fileURLWithPath: path)
        
    }
    
    
    @IBAction func recordBtnOnClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setTitle("stopRecord", for: .normal)
            recorder?.startRecord()
            timer = CADisplayLink.init(target: self, selector: #selector(ViewController.updateVoice))
            timer?.add(to: RunLoop.current, forMode: .commonModes)

        }else{
            sender.setTitle("startRecord", for: .normal)
            recorder?.stopRecord()
            timer?.invalidate()
            timer = nil
        }
    }
    func updateVoice(){
        let power = recorder?.updateVoiceMeters()
        waveView.addMeter(meterValue: power!)
        
    }
    
}



