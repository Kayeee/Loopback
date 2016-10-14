//
//  PlayButton.swift
//  Loopback
//
//  Created by Kevin on 10/9/16.
//  Copyright © 2016 Kevin. All rights reserved.
//

import UIKit


class PlayButton: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.setTitle("Play", for: .normal)
        
        self.setTitleColor(.white, for: .normal)
        
        self.backgroundColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }

}



class TapButton: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.setTitle("Tap", for: .normal)
        
        self.setTitleColor(.white, for: .normal)
        
        self.backgroundColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}


class SaveButton: UIButton {
    
    override init(frame: CGRect) {
                
        super.init(frame: frame)
        
        self.frame = frame
        
        self.setTitle("Save", for: .normal)
        
        self.setTitleColor(.white, for: .normal)
        
        self.backgroundColor = .green
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
}


class CancelButton: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.setTitle("Cancel", for: .normal)
        
        self.setTitleColor(.white, for: .normal)
        
        self.backgroundColor = .red
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
}



class MainPlayButton: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.frame = frame
        
        self.setTitle("Play", for: .normal)
        self.setTitle("Pause", for: .selected)
        
        self.backgroundColor = .white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
