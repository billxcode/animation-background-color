//
//  PanGestureViewController.swift
//  AnimationInSwift
//
//  Created by Bill Tanthowi Jauhari on 18/05/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit
import AVFoundation

class PanGestureViewController: UIViewController {
    @IBOutlet weak var objectGame: UIView!
    @IBOutlet var superView: UIView!
    @IBOutlet weak var headRick: UIView!
    
    var audioPlay: AVPlayer!
    var audioFile: AVAudioFile!
    
    var coordinatX: CGFloat!
    var coordinatY: CGFloat!
    @IBOutlet var padCoordinat: UIPanGestureRecognizer!
    @IBOutlet var headRickGestureOutlet: UIPanGestureRecognizer!
    
    var initialCenter = CGPoint()
    var headRickPosition = CGPoint()
    let objectHeight: CGFloat = 200
    let objectWidth: CGFloat = 200

    
    let player = AVPlayer(url: Bundle.main.url(forResource: "bensound-retrosoul", withExtension: "mp3")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player.play()
        // Do any additional setup after loading the view.
    }
    @IBAction func getCoordinate(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began {
            self.initialCenter = sender.view!.center
        }
        
        if sender.state == .changed {
            let x = initialCenter.x+sender.translation(in: self.objectGame).x-100
            var y = initialCenter.y+sender.translation(in: self.objectGame).y-100
            
            if y <= (self.initialCenter.y-100) {
                y = self.initialCenter.y-100
            }
            
            UIView.animate(withDuration: 0.1) {
                self.objectGame.frame = CGRect(x: x, y: y, width: self.objectWidth, height: self.objectHeight)
            }
        }
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.1) {
                self.objectGame.frame = CGRect(x: self.initialCenter.x-100, y: self.initialCenter.y-100, width: self.objectWidth, height: self.objectHeight)
            }
        }
        
        
    }
    
    @IBAction func headRickGesture(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            self.headRickPosition = sender.view!.center
        }
        
        if sender.state == .changed {
            let x = headRickPosition.x+sender.translation(in: self.headRick).x-100
            var y = headRickPosition.y+sender.translation(in: self.headRick).y-100
            if (y >= (self.headRickPosition.y-100)){
                y = self.headRickPosition.y-100
            }
            UIView.animate(withDuration: 0.1) {
                self.headRick.frame = CGRect(x: x, y: y, width: self.objectWidth, height: self.objectHeight)
            }
        }
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.1) {
                self.headRick.frame = CGRect(x: self.headRickPosition.x-100, y: self.headRickPosition.y-100, width: self.objectWidth, height: self.objectHeight)
            }
        }
        
    }
    
}
