//
//  ViewController.swift
//  unit-test-targets
//
//  Created by Pivotal on 6/13/17.
//  Copyright © 2017 LST. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var moviePlayer : AVPlayer!
    
    @IBOutlet var centerLogoLabelConstraint: NSLayoutConstraint!
    @IBOutlet var gradientView: UIView!
    @IBOutlet var logoLabel: UILabel!
    @IBOutlet var dealButton: UIButton!
    @IBOutlet var launchImageView: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dealButton.isHidden = true
        self.dealButton.alpha = 0.0
        let videoURL = Bundle.main.url(forResource: "bg", withExtension: "mp4");
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            
        }
        let avAsset = AVAsset.init(url: videoURL!)
        let playerItem = AVPlayerItem.init(asset: avAsset)
        moviePlayer = AVPlayer.init(playerItem: playerItem)
        let playerLayer = AVPlayerLayer.init(player: moviePlayer)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = UIScreen.main.bounds
        self.view.layer.insertSublayer(playerLayer, at: 0)
        
        moviePlayer.seek(to: kCMTimeZero)
        moviePlayer.volume = 0.0
        moviePlayer.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.moviePlayer.currentItem)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemStart(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.moviePlayer.currentItem)
        
        let gradient = CAGradientLayer()
        gradient.frame = UIScreen.main.bounds
        gradient.colors = [UIColorFromRGB(rgbValue: 0x030303).cgColor,UIColorFromRGB(rgbValue: 0x030303).withAlphaComponent(0.375).cgColor, UIColorFromRGB(rgbValue: 0x030303).cgColor]
        gradientView.layer.addSublayer(gradient)
        gradientView.alpha = 0.0
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        moviePlayer.pause()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        moviePlayer.play()
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.dealButton.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
                self.launchImageView.alpha = 0.0
                self.gradientView.alpha = 1.0
                self.moviePlayer.play()
                self.centerLogoLabelConstraint.constant = -150
                self.view.layoutIfNeeded()
                self.dealButton.alpha = 1.0
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func playerItemEnd(notification: NSNotification) {
        let playerItem:AVPlayerItem = notification.object as! AVPlayerItem
        playerItem.seek(to: kCMTimeZero, completionHandler: nil)
    }
    
    @objc func playerItemStart(notification: NSNotification) {
        moviePlayer.play()
    }


}

