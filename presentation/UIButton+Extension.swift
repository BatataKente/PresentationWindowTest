//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

extension UIButton {
    
    func setToBottomButtonKeyboardDefault(_ buttonTitle: String = "Continuar",
                                          backgroundColor: UIColor = .purple) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.backgroundColor = backgroundColor
        
        self.heightAnchorInSuperview(50)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, superview?.keyboardLayoutGuide)
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25,
                                                  weight: .bold)
    }
}

extension UIButton {
    
/// This function adds a view as a subview
/// - Parameters:
///   - window: The view that will be the subWindow
///   - orientation: The position that window will move
///   - origin: The origin of window
    func addSubWindow(_ window: UIView,
                      _ orientation: Orientation = .downRight,
                      origin: CGPoint? = nil) {
//
        let size = window.frame.size
        window.frame.size = .zero

        let animate = {

            self.isSelected = true
            window.frame.size = size
            window.alpha = 1
        }

        let reduce = {

            self.isSelected = false
            window.frame.size = .zero
        }

        let timing: (duration: CGFloat,
                     delay: CGFloat) = (duration: 0.3,
                                        delay: 0.1)

        let handler = {(action: UIAction) in

            window.frame.size = .zero
            window.alpha = 0

            switch orientation {

                case .downLeft:

                    if self.isSelected {

                        reduce()
                    }
                    else {

                        if let origin = origin {

                            window.frame.origin = origin
                        }
                        else {

                            window.frame.origin = CGPoint(x: self.frame.maxX,
                                                          y: self.frame.maxY)
                        }

                        UIView.animate(withDuration: timing.duration,
                                       delay: timing.delay) {

                            animate()
                            window.frame.origin.x -= size.width
                        }
                    }

                case .downRight:

                    if self.isSelected {

                        reduce()
                    }
                    else {

                        if let origin = origin {

                            window.frame.origin = origin
                        }
                        else {

                            window.frame.origin = CGPoint(x: self.frame.minX,
                                                          y: self.frame.maxY)
                        }

                        UIView.animate(withDuration: timing.duration,
                                       delay: timing.delay) {

                            animate()
                        }
                    }

                case .upLeft:

                    if self.isSelected {

                        reduce()
                    }
                    else {

                        if let origin = origin {

                            window.frame.origin = origin
                        }
                        else {

                            window.frame.origin = CGPoint(x: self.frame.maxX,
                                                          y: self.frame.minY)
                        }

                        UIView.animate(withDuration: timing.duration,
                                       delay: timing.delay) {

                            animate()
                            window.frame.origin.x -= size.width
                            window.frame.origin.y -= size.height
                        }
                    }

                case .upRight:

                    if self.isSelected {

                        reduce()
                    }
                    else {

                        if let origin = origin {

                            window.frame.origin = origin
                        }
                        else {

                            window.frame.origin = CGPoint(x: self.frame.minX,
                                                          y: self.frame.minY)
                        }

                        UIView.animate(withDuration: timing.duration,
                                       delay: timing.delay) {

                            animate()
                            window.frame.origin.y -= size.height
                        }
                    }

                default:

                    if let origin = origin {

                        window.frame.origin = origin
                    }
                    else {

                        window.frame.origin = CGPoint(x: self.superview?.center.x ?? self.center.x,
                                                      y: self.superview?.center.y ?? self.center.x)
                    }

                    UIView.animate(withDuration: timing.duration,
                                   delay: timing.delay) {

                        animate()
                        window.frame.origin.x -= size.width/2
                        window.frame.origin.y -= size.width/2
                    }
            }
        }

        self.addAction(UIAction(handler: handler), for: .touchUpInside)
    }
}

extension UIButton {
    
    func setLeroLero() {
        
        self.setTitleColor(UIColor.black, for: .normal)
        self.backgroundColor = .green
        
        let handler = {(action: UIAction) in
            
            print("Lero Lero")
        }
        
        self.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        self.constraintInsideTo(.centerX, self.superview)
        self.constraintInsideTo(.centerY, self.superview, (self.superview?.frame.size.height)!/4)
    }
}
