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
    @IBOutlet weak var headRickImageView: UIImageView!
    @IBOutlet weak var footRickImageView: UIImageView!
    
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
 
    //coding music
    let backgroundSound = AVPlayer(url: Bundle.main.url(forResource: "bensound-retrosoul", withExtension: "mp3")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundSound.play()
        // Do any additional setup after loading the view.
    }
    
    private func play() {
        let teriakSound = AVPlayer(url: Bundle.main.url(forResource: "teriak", withExtension: "m4a")!)
        
        teriakSound.play()
    }
    
    private func stop() {
       let teriakSound = AVPlayer(url: Bundle.main.url(forResource: "teriak", withExtension: "m4a")!)
        teriakSound.pause()
    }
    
    @IBAction func getCoordinate(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began {
            self.initialCenter = sender.view!.center
            self.view.sendSubviewToBack(self.footRickImageView)
            self.view.bringSubviewToFront(self.headRickImageView)
            self.play()
        }
        
        if sender.state == .changed {
            let x = initialCenter.x+sender.translation(in: self.objectGame).x-100
            var y = initialCenter.y+sender.translation(in: self.objectGame).y-100
            
            if y <= (self.initialCenter.y-100) {
                y = self.initialCenter.y-100
            }
            
            var imageView = "head"
            
            print(y)

            switch y {
            case (350...450) :
                imageView = "emotion3"
                UIDevice.vibrate()
                if y==350 {
                    UIDevice.vibrate()
                }
                break
            case (300...349) :
                imageView = "emotion2"
                if y==300 {
                    UIDevice.vibrate()
                }
                break
            case (250...299) :
                imageView = "emotion1"
                if y==250 {
                    UIDevice.vibrate()
                }
                break
            default:
                imageView = "head"
                UIDevice.vibrate()
            }
            
            self.headRickImageView.image = UIImage(named: imageView)
            
            UIView.animate(withDuration: 0.1) {
                self.objectGame.frame = CGRect(x: x, y: y, width: self.objectWidth, height: self.objectHeight)
            }

        }
        
        if sender.state == .ended {
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 8, options: .allowUserInteraction, animations: {
                self.objectGame.frame = CGRect(x: self.initialCenter.x-100, y: self.initialCenter.y-100, width: self.objectWidth, height: self.objectHeight)
            }, completion: nil)
            self.stop()
        }
        
        
    }
    
    @IBAction func headRickGesture(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            self.headRickPosition = sender.view!.center
            self.view.sendSubviewToBack(self.headRickImageView)
            self.view.bringSubviewToFront(self.footRickImageView)
            self.play()
        }
        
        if sender.state == .changed {
            let x = headRickPosition.x+sender.translation(in: self.headRick).x-100
            var y = headRickPosition.y+sender.translation(in: self.headRick).y-100
            if (y >= (self.headRickPosition.y-100)){
                y = self.headRickPosition.y-100
            }
            
            var imageView = "head"
            
            switch (y * -1) {
            case (150...250) :
                imageView = "emotion3"
                UIDevice.vibrate()
                break
            case (100...149) :
                imageView = "emotion2"
                UIDevice.vibrate()
                break
            case (50...99) :
                imageView = "emotion1"
                UIDevice.vibrate()
                break
            default:
                imageView = "head"
                UIDevice.vibrate()
            }
            
            self.headRickImageView.image = UIImage(named: imageView)
            
            UIView.animate(withDuration: 0.1) {
                self.headRick.frame = CGRect(x: x, y: y, width: self.objectWidth, height: self.objectHeight)
            }
        }
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 8, options: .allowUserInteraction, animations: {
                self.headRick.frame = CGRect(x: self.headRickPosition.x-100, y: self.headRickPosition.y-100, width: self.objectWidth, height: self.objectHeight)
            }, completion: nil)
            self.stop()
        }
        
    }
    
}


extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
