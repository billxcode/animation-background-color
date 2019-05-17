//
//  ViewController.swift
//  AnimationInSwift
//
//  Created by Bill Tanthowi Jauhari on 17/05/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewFrame: UIView!
    @IBOutlet var superView: UIView!
    
    var arrColor: [UIColor]!
    var index:Int = 0
    var heightScreen: CGFloat!
    var widthScreen: CGFloat!
    var halfHeightScreen: CGFloat!
    var halfWidthScreen: CGFloat!
    var screen: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrColor = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)]
        
        self.screen = superView.frame
        self.heightScreen = (screen.height-100)
        self.widthScreen = (screen.width-100)
        self.halfWidthScreen = self.widthScreen/2
        self.halfHeightScreen = self.heightScreen/2
        
        
//        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
        
        self.viewFrame.layer.cornerRadius = 50
        
        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func moveRandomly(_ sender: UITapGestureRecognizer) {
        if sender.isEnabled {
            print("touch me again")
            var randomX = Int.random(in: 1...(Int(self.widthScreen)))
            var randomY = Int.random(in: 1...(Int(self.heightScreen)))
            UIView.animate(withDuration: 0.5, animations: {
                self.viewFrame.frame = CGRect(x: randomX, y: randomY, width: 100, height: 100)
            })
            
            if randomX > Int(halfWidthScreen) {
                randomX -= 30
            } else {
                randomX += 30
            }
            
            if randomY > Int(halfHeightScreen) {
                randomY -= 30
            } else {
                randomY += 30
            }
            
            UIView.animate(withDuration: 0.2) {
                self.viewFrame.frame = CGRect(x: randomX, y: randomY, width: 100, height: 100)
            }
        }
    }
    
    @objc public func changeColor() {
        UIView.animate(withDuration:0.5, animations: {
            self.viewFrame.backgroundColor = self.arrColor[self.index]
            self.index+=1
            if self.index == self.arrColor.count {
                self.index = 0
            }
        })
    }


}

