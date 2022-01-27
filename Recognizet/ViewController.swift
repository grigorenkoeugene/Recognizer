//
//  ViewController.swift
//  Recognizet
//
//  Created by Евгений Григоренко on 26.01.22.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
      if let view = recognizer.view {
        view.center = CGPoint(x:view.center.x + translation.x,
                                y:view.center.y + translation.y)
      }
        recognizer.setTranslation(.zero, in: self.view)
    }
    
    @IBAction func handlePinch(recognizer: UIPinchGestureRecognizer) {
      if let view = recognizer.view {
        view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
        recognizer.scale = 1
      }
    }
    
    @IBAction func handleRotate(recognizer: UIRotationGestureRecognizer) {
      if let view = recognizer.view {
        view.transform = view.transform.rotated(by: recognizer.rotation)
        recognizer.rotation = 0
      }
    }
    
    func gestureRecognizer(_: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
      return true
    }

}

