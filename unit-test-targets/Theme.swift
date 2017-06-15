//
//  Theme.swift
//  unit-test-targets
//
//  Created by Pivotal on 6/15/17.
//  Copyright © 2017 LST. All rights reserved.
//

import UIKit

protocol Theme {
    
    //Button - Generic
    var buttonCornerRadius : CGFloat { get }
    var buttonBorderWidth : CGFloat { get }
    var buttonBorderColor : UIColor { get }
    
    //Button - CTA
    var buttonCTACornerRadius : CGFloat { get }
    var buttonCTABorderWidth : CGFloat { get }
    var buttonCTABorderColor : UIColor { get }
    
    //Button - Danger
    var buttonDangerCornerRadius : CGFloat { get }
    var buttonDangerBorderWidth : CGFloat { get }
    var buttonDangerBorderColor : UIColor { get }
    
}
