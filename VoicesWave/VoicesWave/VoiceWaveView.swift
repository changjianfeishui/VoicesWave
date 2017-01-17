//
//  VoiceWaveView.swift
//  VoicesWave
//
//  Created by XB on 2017/1/17.
//  Copyright © 2017年 Miu. All rights reserved.
//

import UIKit

class VoiceWaveView: UIView {
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.black
    }
    
    lazy var values:[Float] = {
        var array = [Float]()
        return array
    }()
    func addMeter(meterValue value:Float) -> Void {
        values.append(value)
        self.setNeedsDisplay()
    }
    let minValue:Float = -160
    let maxValue:Float = 0
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
    }

}
