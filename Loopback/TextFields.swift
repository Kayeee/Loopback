//
//  BPMTextField.swift
//  Loopback
//
//  Created by Kevin on 10/9/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import UIKit

class CountOffTextField: UITextField {

    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.text = "4"
        
        self.keyboardType = UIKeyboardType.numberPad
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
