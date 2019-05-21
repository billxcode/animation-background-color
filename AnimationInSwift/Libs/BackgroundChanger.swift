//
//  BackgroundChanger.swift
//  AnimationInSwift
//
//  Created by Bill Tanthowi Jauhari on 21/05/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import Foundation
import UIKit

class BackgroundChanger {
    let background: UIView!
    let color: [UIColor] = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
    
    init(backgroundParam: UIView) {
        self.background = backgroundParam
        self.startChange()
    }
    
    public func startChange() {
        Timer.scheduledTimer(timeInterval: 1, target: self.background, selector: ("#changeBackground()"), userInfo: nil, repeats: true)
    }
    
    @objc public func changeBackground() {
        print("change background")
    }
}
