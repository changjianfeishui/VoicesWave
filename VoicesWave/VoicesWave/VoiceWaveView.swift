//
//  VoiceWaveView.swift
//  VoicesWave
//
//  Created by XB on 2017/1/17.
//  Copyright © 2017年 Miu. All rights reserved.
//

import UIKit

class VoiceWaveView: UIScrollView {
    
    override func awakeFromNib() {
        self.isScrollEnabled = false
    }
    
    lazy var values:[Float] = {
        var array = [Float]()
        return array
    }()
    
    let maxValue:Float = 60
    let minValue:Float = 0

    func addMeter(meterValue value:Float) -> Void {
        /*
         The current average power, in decibels, for the sound being recorded. A  value of 0 dB indicates full scale, or maximum power; a return value of -160 dB indicates minimum power (that is, near silence).
         [-160,0]
         If the signal provided to the audio recorder exceeds ±full scale, then the return value may exceed 0 (that is, it may enter the positive range).
         */
        //这里只绘制[-60,0]
        
        //将绘制数据转换到区间[0,60]
        var transValue = ((value+60)>maxValue ? maxValue : value+60)
        transValue = ((value+60)<minValue ? minValue : transValue)

        values.append(transValue)
        
        let midX = self.bounds.size.width * 0.5
        if CGFloat(values.count) > midX {
            self.contentSize = CGSize.init(width: CGFloat(values.count), height: 0)
            self.contentOffset = CGPoint(x: CGFloat(values.count)-CGFloat(200), y: 0)
        }
        
        self.setNeedsDisplay()
        
    }
    
    override func draw(_ rect: CGRect) {
        print("rect: \(rect)")

        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        //画布背景
        context.setFillColor(UIColor.green.cgColor)
        context.fill(rect)
        
        let midY = bounds.midY
        let halfPath = CGMutablePath()
        halfPath.move(to: CGPoint.init(x: 0, y: midY))
        
        //绘制一个单位的value需要多少单位高度
        let perPoint = Float.init(midY)/self.maxValue
    
        for i in 0..<self.values.count {
            let sample = self.values[i]
            halfPath.addLine(to: CGPoint.init(x: CGFloat(i), y: midY-CGFloat(sample * perPoint)))
        }

        context.addPath(halfPath)
        context.setStrokeColor(UIColor.red.cgColor)
        context.drawPath(using: .stroke)
        

        
        
    }

}
