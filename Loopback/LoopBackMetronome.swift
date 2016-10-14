//
//  LoopBackMetronome.swift
//  Loopback
//
//  Created by Kevin on 10/9/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import Foundation

class LoopBackMetronome: BCMetronome {
    
    var countOffBars = 4
    
    var loopBackBars = 4
    
    private var barsToPlay: Int?
    
    override var continuousBars: Int {
        didSet{
            if continuousBars == barsToPlay {
                stop()
            }
        }
    }
    
    func startCountOff() {
        barsToPlay = countOffBars
        start()
    }
    
    func startLoopBack() {
        barsToPlay = countOffBars
        start()
    }
    
}
