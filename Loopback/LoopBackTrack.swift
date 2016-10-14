//
//  Song.swift
//  Loopback
//
//  Created by Kevin on 10/11/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import Foundation
import MediaPlayer

class LoopBackTrack: NSObject {
    
    var track: MPMediaItem!
    
    var loopPairs: [Int:(Float, Float)] = [:]
    
    var metronome: LoopBackMetronome?
    
    var player : MPMusicPlayerController! = nil
    
    var isPlaying: Bool = false
    
    
    override init() {
        
        let items = MPMediaQuery.songs().items
        
        track = items![0]
        
        metronome = LoopBackMetronome()
        
        let collection = MPMediaItemCollection(items: [self.track])
        
        player = MPMusicPlayerController.applicationMusicPlayer()
        
        player.setQueue(with: collection)
        
    }
    
    
    init(track: MPMediaItem, loopPairs: [Int:(Float, Float)], metronome: LoopBackMetronome) {
        
        self.track = track
        
        self.loopPairs = loopPairs
        
        self.metronome = metronome
        
        let collection = MPMediaItemCollection(items: [self.track])
        
        player = MPMusicPlayerController.applicationMusicPlayer()
        
        player.setQueue(with: collection)
    }
    
    
    func play() {
        player.prepareToPlay()
        player.play()
    }
    
    
    func pause() {
        player.pause()
    }
    

    func addLoopPoint(index: Int, inOrOut: Int){
        
        //inOrOut: 0 means in. 1 means out.
        
    }
    
    
    func getPlaybackTime() -> TimeInterval{
        return player.currentPlaybackTime
    }
}
