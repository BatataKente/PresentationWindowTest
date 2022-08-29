//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

//Extension related to verification of size of screen of a ViewController
extension UIView {
    
/// This function checks whether the device is an ipad or not
/// - Returns: True if is Ipad of false if not
    func isIpad() -> Bool {
        
        if UIScreen.main.traitCollection.userInterfaceIdiom == .pad {
            
            return true
        }
        return false
    }
}

//Extensions related to creation of elements
extension UIView {
    
/// This function adds a line below a view
/// - Parameters:
///   - color: The color of line
///   - width: The width of line
///   - y: Position y of the line
    func addBottomLineWithColor(color: UIColor = .gray, width: CGFloat = 0.8, y: CGFloat = 0) {

        let bottomBorderLine = CALayer()
        bottomBorderLine.backgroundColor = color.cgColor
        bottomBorderLine.frame = CGRect(x: 0,
                                        y: self.frame.size.height - width + y,
                                        width: self.frame.size.width,
                                        height: width)

        self.layer.addSublayer(bottomBorderLine)
    }
}

//Extensions related to constraints
extension UIView {
    
/// This function sets the height of a view in a superview
/// - Parameter constant: The height of view
    func heightAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.heightAnchor.constraint(equalToConstant: constant))
    }
    
/// This function sets the width of a view in a superview
/// - Parameter constant: The width of view
    func widthAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.widthAnchor.constraint(equalToConstant: constant))
    }
    
/// This function sets the width and height of a view in a superview(square)
/// - Parameter constant: The size of view
    func sizeAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraints([
        
            self.heightAnchor.constraint(equalToConstant: constant),
            self.widthAnchor.constraint(equalToConstant: constant)
        ])
    }
    
/// This function fills a superview with the view
/// - Parameter constant: The margins of view to superview
    func fillSuperview(_ constant: CGFloat = 0) {
        
        self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide, constant)
    }
    
/// This function creates the constraint of a view in a superview directed to some other view
/// - Parameters:
///   - attribute: The side that will match the side of the item
///   - toItem: The item at the other point of the constraint
///   - constant: The distance from attribute
///   - multiplier: Multiplier for constant
    func constraintTo(_ attribute: NSLayoutConstraint.Attribute,
                      _ toItem: Any?,
                      _ constant: CGFloat = 0,
                      multiplier: CGFloat = 1) -> NSLayoutConstraint {
        
        NSLayoutConstraint(item: self,
                           attribute: attribute,
                           relatedBy: .equal,
                           toItem: toItem,
                           attribute: attribute,
                           multiplier: multiplier,
                           constant: constant)
    }
    
/// This function creates the constraint of a view in a superview directed to some other view with reference to the same part. example bottom to bottom
/// - Parameters:
///   - attribute: The side that will match the side of the item(if bottom or trailing it will be the inverse to stay inside)
///   - toItem: The item at the other point of the constraint
///   - constant: The distance from attribute
///   - multiplier: Multiplier for constant
    func constraintInsideTo(_ attribute: NSLayoutConstraint.Attribute,
                                 _ toItem: Any?,
                                 _ constant: CGFloat = 0,
                                 multiplier: CGFloat = 1) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if attribute == .bottom || attribute == .trailing {
            
            superview?.addConstraint(NSLayoutConstraint(item: self,
                                                        attribute: attribute,
                                                        relatedBy: .equal,
                                                        toItem: toItem,
                                                        attribute: attribute,
                                                        multiplier: multiplier,
                                                        constant: -constant))
        }
        
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: attribute,
                                                    relatedBy: .equal,
                                                    toItem: toItem,
                                                    attribute: attribute,
                                                    multiplier: multiplier,
                                                    constant: constant))
    }
    
/// This function creates the constraint of a view in a superview directed to some other view with reference to the reverse part. example bottom to top
/// - Parameters:
///   - attribute: The side that will match the inverse side of the item
///   - toItem: The item at the other point of the constraint
///   - constant: The distance from item attribute
///   - multiplier: Multiplier for constant
    func constraintOutsideTo(_ attribute: NSLayoutConstraint.Attribute,
                                  _ toItem: Any?,
                                  _ constant: CGFloat = 0,
                                  multiplier: CGFloat = 1) {
         
        translatesAutoresizingMaskIntoConstraints = false
        
        let itemAttribute: NSLayoutConstraint.Attribute
        
        switch attribute {
            
            case .top: itemAttribute = .bottom
            case .trailing: itemAttribute = .leading
            case .leading: itemAttribute = .trailing
            case .bottom: itemAttribute = .top
            case .height: itemAttribute = .width
            case .width: itemAttribute = .height
            default: itemAttribute = attribute
        }
        
        if attribute == .bottom || attribute == .trailing {
            
            superview?.addConstraint(NSLayoutConstraint(item: self,
                                                        attribute: attribute,
                                                        relatedBy: .equal,
                                                        toItem: toItem,
                                                        attribute: itemAttribute,
                                                        multiplier: multiplier,
                                                        constant: -constant))
        }
        
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: attribute,
                                                    relatedBy: .equal,
                                                    toItem: toItem,
                                                    attribute: itemAttribute,
                                                    multiplier: multiplier,
                                                    constant: constant))
    }
    
/// This Functions shows an view like a window
/// - Parameters:
///   - size: The size of the window
///   - origin: The origin of the window
///   - orientation: The orientation to show the window
//    func showLikeAWindow(size: CGSize,
//                         origin: CGPoint,
//                         _ orientation: Orientation = .downRight) {
//
//        self.frame.origin = origin
//
//        let timing: (duration: CGFloat,
//                     delay: CGFloat) = (duration: 0.3,
//                                        delay: 0.1)
//
//        if self.frame.size == .zero {
//
//            switch orientation {
//
//                case .downLeft:
//
//                    UIView.animate(withDuration: timing.duration,
//                                   delay: timing.delay) {
//
//                        self.frame.origin.x -= size.width
//                        self.frame.size = size
//                    }
//
//                case .downRight:
//
//                    UIView.animate(withDuration: timing.duration,
//                                   delay: timing.delay) {
//
//                        self.frame.size = size
//                    }
//
//                case .upLeft:
//
//                    UIView.animate(withDuration: timing.duration,
//                                   delay: timing.delay) {
//
//                        self.frame.origin.x -= size.width
//                        self.frame.origin.y -= size.height
//                        self.frame.size = size
//                    }
//
//                case .upRight:
//
//                    UIView.animate(withDuration: timing.duration,
//                                   delay: timing.delay) {
//
//                        self.frame.origin.y -= size.height
//                        self.frame.size = size
//                    }
//
//                default:
//
//                    UIView.animate(withDuration: timing.duration,
//                                   delay: timing.delay) {
//
//                        self.frame.origin.x -= size.width/2
//                        self.frame.origin.y -= size.height/2
//                        self.frame.size = size
//                    }
//            }
//        }
//        else {
//
//            self.frame.size = .zero
//        }
//    }
    
    
/// This Functions shows an view like a window
/// - Parameters:
///   - size: The size of the window
///   - origin: The origin of the window
///   - orientation: The orientation to show the window
    func showLikeAWindow(size: CGSize,
                         height: NSLayoutConstraint,
                         width: NSLayoutConstraint,
                         _ orientation: Orientation = .downRight) {
        
        let timing: (duration: CGFloat,
                     delay: CGFloat) = (duration: 0.6,
                                        delay: 0.15)
        
        UIWindow.animate(withDuration: timing.duration,
                         delay: timing.delay) {
            
            height.constant = size.height
            width.constant = size.width
        }
    }
}

//Extensions to add multiple Subviews on a view
extension UIView {
    
/// This function add an array of views as subviews
/// - Parameter views: Views to add
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
}
