//
//  MainVC.swift
//  Loopback
//
//  Created by Kevin on 10/11/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import UIKit
import MediaPlayer


class MainVC: UIViewController {

    //#################################SetUp################################
    var track: LoopBackTrack! = nil
    
    var progressBar: UISlider! = nil
    
    var updater : CADisplayLink! = nil
    
    let playButton: MainPlayButton = MainPlayButton(frame: CGRect(x: 40, y: 50, width: 100, height: 50))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MPMediaLibrary.requestAuthorization({status in
           print(status)
        })
        
        track = LoopBackTrack()
        
        self.view.backgroundColor = .darkGray
        
        progressBar = UISlider(frame: CGRect(x: 10, y: 100, width: view.frame.width - 20, height: 50))
        progressBar.minimumValue = 0
        progressBar.maximumValue = 100
        
        addSubviews()
        addTargets()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //#################################Actions################################
    func playPauseAction() {
        
        playButton.isSelected = !(playButton.isSelected)
        
        if playButton.isSelected {
            updater = CADisplayLink(target: self, selector: #selector(trackAudio)) //*
            updater.frameInterval = 1
            updater.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
            track.player.currentPlaybackTime = (Double(progressBar.value) * track.track.playbackDuration) / 100.0
            track.play()
        }else{
            updater.isPaused = true
            track.pause()
        }
    }
    
    
    func trackAudio() {
        
        let normalizedTime = Float(track.getPlaybackTime() * 100.0 / track.track.playbackDuration)
        progressBar.value = normalizedTime
        
    }
    
    
    func startScrub(){
        playPauseAction()
    }
    
    
    func endScrub(){
        playPauseAction()
    }
    
    
    
    //#################################Misc################################
    func addTargets() {
        
        progressBar.addTarget(self, action: #selector(startScrub), for: UIControlEvents.touchDown)
        progressBar.addTarget(self, action: #selector(endScrub), for: UIControlEvents.touchUpInside)
        playButton.addTarget(self, action: #selector(playPauseAction), for: .touchUpInside)
    }
    
    func addSubviews(){
        
        self.view.addSubview(progressBar)
        self.view.addSubview(playButton)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
