//
//  StartView.swift
//  unit-test-targets
//
//  Created by Pivotal on 6/15/17.
//  Copyright © 2017 LST. All rights reserved.
//

import UIKit

class StartView: UIView {
    
    @IBOutlet var showArray: [UIView]!

    func showOptions() {
        UIView.animate(withDuration: 1.0, delay: 0.3, options: .curveLinear, animations: {
            for view in self.showArray {
                view.isHidden = false
            }
        })
    }
}
