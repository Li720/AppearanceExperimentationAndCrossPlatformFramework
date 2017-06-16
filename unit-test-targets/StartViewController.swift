//
//  ViewController.swift
//  unit-test-targets
//
//  Created by Pivotal on 6/13/17.
//  Copyright © 2017 LST. All rights reserved.
//

import UIKit
import AVFoundation

class StartViewController: UIViewController {
    
    var startView: StartView! { return view as! StartView }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startView.showOptions()
    }
    
    @IBAction func userDidSelectStandard(_ sender: Any) {
            
    }
    
    @IBAction func userDidSelectEvil(_ sender: Any) {
    }
    
    @IBAction func userDidSelectXCode(_ sender: Any) {
    }
}

