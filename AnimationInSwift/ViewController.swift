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
    
    var arrColor: [UIColor]!
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrColor = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1) , #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)]
        
        Timer.scheduledTimer(timeInterval: 2.3, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc public func changeColor() {
        UIView.animate(withDuration:2, animations: {
            self.viewFrame.backgroundColor = self.arrColor[self.index]
            self.index+=1
            if self.index == self.arrColor.count {
                self.index = 0
            }
        })
    }


}

