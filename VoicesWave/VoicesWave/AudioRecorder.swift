//
//  AudioRecorder.swift
//  VoicesWave
//
//  Created by XB on 2017/1/16.
//  Copyright © 2017年 Miu. All rights reserved.
//

import Foundation
import AVFoundation

class AudioRecorder:NSObject {
    private var recorder:AVAudioRecorder?
    var filePath:String
    
    init(fileURLWithPath path:String) {
        filePath = path
        super.init()
        let url = URL.init(fileURLWithPath: path)
        let settings:[String : Any] = [
            AVFormatIDKey:kAudioFormatAppleIMA4,
            AVSampleRateKey:44100.0,
            AVNumberOfChannelsKey:1,
            AVEncoderBitDepthHintKey:16,
            AVEncoderAudioQualityKey:AVAudioQuality.medium
        ]
        
        do {
            try recorder = AVAudioRecorder(url: url, settings: settings)
            
        } catch  {
            print(error)
        }
        recorder?.delegate = self
        recorder?.isMeteringEnabled = true
        recorder?.prepareToRecord()
    }
    
    func startRecord() {
        recorder?.record()
    }
    func stopRecord() {
        recorder?.stop()

    }
}


extension AudioRecorder:AVAudioRecorderDelegate{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("finish")
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print(error!.localizedDescription)
    }
}
