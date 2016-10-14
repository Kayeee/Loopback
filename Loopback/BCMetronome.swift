//
//  BCMetronome.swift
//  Loopback
//
//  Created by Kevin on 10/8/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import Foundation
import AVFoundation


enum BCBeatsPerBar: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case eleven = 11
    case twelve = 12
    case thirteen = 13
    case fourteen = 14
    case fifteen = 15
    case sixteen = 16
}

enum BCBeatNote: Int{
    case whole = 1
    case half = 2
    case quarter = 4
    case eighth = 8
    case sixteenth = 16
    case thirtySecond = 32
}


class BCMetronome : NSObject {
    
    private let highTickURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "MetronomeUp", ofType: "mp3")!)
    
    private var highTickPlayer: AVAudioPlayer!
    
    private let lowTickURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Metronome", ofType: "mp3")!)
    
    private var lowTickPlayer: AVAudioPlayer!
    
    private var metronomeTimer: Timer!
    
    var continuousBars: Int = 0
    
    var beatsPerBar: BCBeatsPerBar = BCBeatsPerBar.four
    
    var beatNote: BCBeatNote = BCBeatNote.quarter
    
    var bpm: Int = 200
    
    var isRunning: Bool = false
    
    var tickCount: Int = 1 {
        didSet{
            print(tickCount)
        }
    }
    
    
    
    //######################################-Initialization-#######################################
    override init(){
        super.init()
        loadTicks()
    }
    
    
    init(bpm: Int, beatsPerBar: BCBeatsPerBar, beatNote: BCBeatNote){
        super.init()
        self.bpm = bpm
        self.beatsPerBar = beatsPerBar
        self.beatNote = beatNote
        loadTicks()
    }
    
    
    private func loadTicks(){
        do {
            lowTickPlayer = try AVAudioPlayer(contentsOf: lowTickURL as URL)
        } catch {
            print("could not find file")
        }
        
        do {
            highTickPlayer = try AVAudioPlayer(contentsOf: highTickURL as URL)
        } catch {
            print("could not find file")
        }
    }
    
    
    
    //######################################-Public-Functions-#######################################
    func start() {
        
        let interval = calculateTimeInterval()
        
        self.isRunning = true
        
        metronomeTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(playTick), userInfo: nil, repeats: true)

    }
    
    
    func stop() {
        
        metronomeTimer.invalidate()
        
        self.isRunning = false
        
        continuousBars = 0
        
        tickCount = 1
        
    }
    
    
    func toggle() -> Bool {
        
        if self.isRunning {
            stop()
        } else {
            start()
        }
        
        return self.isRunning
    }
    
    //I want to set/get continuousBars from within the class but only get from outside.
    func getContinuousBars() -> Int{
        
        return self.continuousBars
    }
    
    
    //######################################-Private-Functions-#######################################
    @objc private func playTick() {

        //Increment tick count in switch so any listener for continuousBars will have the new accurate tick count
        //looks better than doing it before, after, or in every case. 
        
        switch (tickCount % beatsPerBar.rawValue, tickCount += 1) {
           
        case (0, _):
            continuousBars += 1
            lowTickPlayer.play()
            print("lowTick")
            
        case (1, _):
            highTickPlayer.play()
            print("highTick")
            
        default :
            lowTickPlayer.play()
            print("lowTick")
        }
        
    }
    
    
    private func calculateTimeInterval() -> TimeInterval{
        
        return TimeInterval(60.0/Double(bpm))
    }
    
}
