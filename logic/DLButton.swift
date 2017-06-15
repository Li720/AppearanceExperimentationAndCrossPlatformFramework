//
//  DLButton.swift
//  unit-test-targets
//
//  Created by Pivotal on 6/15/17.
//  Copyright © 2017 LST. All rights reserved.
//

import UIKit

class DLButton: UIButton {

    var cornerRadius : CGFloat = 0.0
    var borderWidth : CGFloat = 0.0
    var borderColor : UIColor = UIColor.clear
    
    dynamic func setCornerRadius(radius: CGFloat) {
        cornerRadius = radius
        self.layer.cornerRadius = cornerRadius
    }
    
    dynamic func setBorderWidth(width: CGFloat) {
        borderWidth = width
        self.layer.borderWidth = borderWidth
    }
    
    dynamic func setBorderColor(color: UIColor) {
        borderColor = color
        self.layer.borderColor = borderColor.cgColor
    }
    
}
