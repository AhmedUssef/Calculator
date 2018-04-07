//
//  Mycustombutton.swift
//  Calculator
//
//  Created by Ahmed on 3/29/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit

class Mycustombutton : UIButton {
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
    }
}
