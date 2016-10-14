//
//  BPMPickerView.swift
//  Loopback
//
//  Created by Kevin on 10/9/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import UIKit

class BPMPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    var bpmOptions: [Int] = []
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        self.frame = frame
                
        for i in 40...250 {
            bpmOptions.append(i)
        }
        
        self.delegate = self
        
        self.dataSource = self

    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bpmOptions.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(describing: bpmOptions[row])
    }
    
    
    override func selectRow(_ row: Int, inComponent component: Int, animated: Bool) {
        
        //do math of row here rather than in controller
        super.selectRow(row-bpmOptions[0], inComponent: component, animated: animated)
    }
    
    
    func getSelectedValue() -> Int{
        
        return bpmOptions[self.selectedRow(inComponent: 0)]
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}



class BeatsPerBarStepper: UIStepper {
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.maximumValue = 16
        
        self.minimumValue = 1
        
        self.value = 4
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class BeatNoteStepper: UIStepper {
        
    override var value: Double {
        get{
            return pow(2, super.value)
        }
        
        set{
            super.value = newValue
        }
    }
    
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.maximumValue = 5
        
        self.minimumValue = 0 //because we are returning 2^value
        
        self.value = 4
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class CountOffBarsStepper: UIStepper {
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.maximumValue = 16
        
        self.minimumValue = 0
        
        self.value = 1
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class LoopBarsStepper: UIStepper {
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.maximumValue = 16
        
        self.minimumValue = 0
        
        self.value = 2
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
