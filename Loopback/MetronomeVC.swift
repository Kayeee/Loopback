//
//  MetronomeVC.swift
//  Loopback
//
//  Created by Kevin on 10/9/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import UIKit

class MetronomeVC: UIViewController {

    
    let metronome = LoopBackMetronome()
    
    let tapButton = TapButton(frame: CGRect(x: 200, y: 20, width: 100, height: 100))
    let playButton = PlayButton(frame: CGRect(x: 0, y: 20, width: 50, height: 50))
    let saveButton = SaveButton(frame: CGRect(x: 150, y: 575, width: 145, height: 50))
    let cancelButton = CancelButton(frame: CGRect(x: 30, y: 575, width: 70, height: 50))
    
    let bpmPickerView: BPMPickerView = BPMPickerView(frame: CGRect(x: 70, y: 25, width: 75, height: 75))
    
    let beatsPerBarLabel = UILabel(frame: CGRect(x: 40, y: 40, width: 100, height: 30))
    let beatsPerBarStepper = BeatsPerBarStepper(frame: CGRect(x: 200, y: 40, width: 100, height: 25))
    let beatNoteLabel = UILabel(frame: CGRect(x: 40, y: 80, width: 100, height: 30))
    let beatNoteStepper = BeatNoteStepper(frame: CGRect(x: 200, y: 80, width: 100, height: 25))
    
    var countOffContainer: NumberOfBarsContainer? = nil
    var barsBetweenContainer: NumberOfBarsContainer? = nil
    
    @IBOutlet var bpmContainerView: UIView!
    @IBOutlet weak var timeSigContainer: UIView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        
        countOffContainer = NumberOfBarsContainer(frame: CGRect(x: 0, y: 425, width: view.frame.width, height: 75))
        barsBetweenContainer = NumberOfBarsContainer(frame: CGRect(x: 0, y: 500, width: view.frame.width, height: 75))
        
        //#############Testing Layout ##############
        beatsPerBarLabel.backgroundColor = .green
        beatNoteLabel.backgroundColor = .green
        
        //############end testing ##############
        
        //Load data into fields
        beatsPerBarLabel.text = String(Int(beatsPerBarStepper.value))
        beatsPerBarLabel.textAlignment = NSTextAlignment.center
        beatNoteLabel.text = String(Int(beatNoteStepper.value))
        beatNoteLabel.textAlignment = NSTextAlignment.center
        
        countOffContainer?.stepper.value = Double(metronome.countOffBars)
        countOffContainer?.label.text = "Count off: \(metronome.countOffBars) bars"
        barsBetweenContainer?.stepper.value = Double(metronome.loopBackBars)
        barsBetweenContainer?.label.text = "Bars between loops: \(metronome.loopBackBars)"
        
        bpmPickerView.selectRow(metronome.bpm, inComponent: 0, animated: false)
        
        setTargets()
        addSubviews()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    
    //######################################-Actions-#######################################
    func playAction(){
        
        if metronome.isRunning{
            self.metronome.stop()
        }else{
            self.metronome.startCountOff()
        }
    }
    
    
    func saveAction() {
        self.metronome.bpm = self.bpmPickerView.getSelectedValue()
        self.metronome.beatsPerBar = BCBeatsPerBar(rawValue: Int(self.beatsPerBarStepper.value))!
        self.metronome.beatNote = BCBeatNote(rawValue: Int(self.beatNoteStepper.value))!
        self.metronome.countOffBars = Int((countOffContainer?.stepper.value)!)
        print(self.metronome.countOffBars)
    }
    
    
    func beatsPerBarAction() {
        self.beatsPerBarLabel.text = String(Int(beatsPerBarStepper.value))
    }

    
    func beatNoteAction() {
        self.beatNoteLabel.text = String(Int(beatNoteStepper.value))
    }
    
    
    func countOffAction() {
        let value = Int((countOffContainer?.stepper.value)!)
        countOffContainer?.label.text = "Count off: \(value) bars"
    }
    
    
    func barsBetweenAction() {
        let value = Int((barsBetweenContainer?.stepper.value)!)
        barsBetweenContainer?.label.text = "Bars between loops: \(value)"
    }
    
    
    
    //######################################-Misc-#######################################
    func setTargets() {
        
        playButton.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        beatsPerBarStepper.addTarget(self, action: #selector(beatsPerBarAction), for: .allTouchEvents)
        beatNoteStepper.addTarget(self, action: #selector(beatNoteAction), for: .allTouchEvents)
        
        countOffContainer?.stepper.addTarget(self, action: #selector(countOffAction), for: .allTouchEvents)
        barsBetweenContainer?.stepper.addTarget(self, action: #selector(barsBetweenAction), for: .allTouchEvents)
    }
    
    
    func addSubviews() {
        
        bpmContainerView!.addSubview(bpmPickerView)
        bpmContainerView.addSubview(tapButton)
        
        timeSigContainer.addSubview(beatsPerBarStepper)
        timeSigContainer.addSubview(beatsPerBarLabel)
        timeSigContainer.addSubview(beatNoteStepper)
        timeSigContainer.addSubview(beatNoteLabel)
        
        self.view.addSubview(playButton)
        //self.view.addSubview(tapButton)
        self.view.addSubview(saveButton)
        self.view.addSubview(cancelButton)
        
        self.view.addSubview(countOffContainer!)
        self.view.addSubview(barsBetweenContainer!)
        
    }
}
