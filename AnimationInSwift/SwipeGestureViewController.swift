//
//  SwipeGestureViewController.swift
//  AnimationInSwift
//
//  Created by Bill Tanthowi Jauhari on 18/05/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class SwipeGestureViewController: UIViewController {
    @IBOutlet weak var objectGame: UIView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objectGame.layer.cornerRadius = 50
        print(swipeGesture.direction.rawValue)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func swipeGestureAction(_ sender: UISwipeGestureRecognizer) {
        print(sender.direction.rawValue)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
