//
//  ContainerViews.swift
//  Loopback
//
//  Created by Kevin on 10/9/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import UIKit

class NumberOfBarsContainer: UIView {

    let stepper = CountOffBarsStepper(frame: CGRect(x: 210, y: 10, width: 100, height: 50))
    let label = UILabel(frame: CGRect(x: 5, y: 10, width: 200, height: 50))
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.backgroundColor = .white
        label.backgroundColor = .green
        
        self.addSubview(label)
        self.addSubview(stepper)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


class TimeSigContainer: UIView {

    let beatsPerBarLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let beatsPerBarStepper = BeatsPerBarStepper(frame: CGRect(x: 100, y: 0, width: 100, height: 50))
    
    let beatNoteLabel = UILabel(frame: CGRect(x: 0, y: 50, width: 50, height: 50))
    let beatNoteStepper = BeatNoteStepper(frame: CGRect(x: 100, y: 50, width: 100, height: 50))
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.backgroundColor = .white
        
        beatsPerBarLabel.backgroundColor = .red
        beatNoteLabel.backgroundColor = .red
        
        self.addSubview(beatsPerBarLabel)
        self.addSubview(beatsPerBarStepper)
        self.addSubview(beatNoteLabel)
        self.addSubview(beatNoteStepper)
        
    }
    
    func loadData(beatsPerBar: Double, beatNote: Double) {
        beatsPerBarLabel.text = String(Int(beatsPerBar))
        beatNoteLabel.text = String(Int(beatNote))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
