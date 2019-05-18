//
//  PanGestureViewController.swift
//  AnimationInSwift
//
//  Created by Bill Tanthowi Jauhari on 18/05/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class PanGestureViewController: UIViewController {
    @IBOutlet weak var objectGame: UIView!
    @IBOutlet var superView: UIView!
    
    var coordinatX: CGFloat!
    var coordinatY: CGFloat!
    @IBOutlet var padCoordinat: UIPanGestureRecognizer!
    var initialCenter = CGPoint()
    let objectHeight: CGFloat = 200
    let objectWidth: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func getCoordinate(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began {
            self.initialCenter = sender.view!.center
        }
        
        if sender.state == .changed {
            let x = initialCenter.x+sender.translation(in: self.objectGame).x-100
            let y = initialCenter.y+sender.translation(in: self.objectGame).y-100
            
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
    
}
