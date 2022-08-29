//
//  View_5.swift
//  presentation
//
//  Created by Josicleison on 29/08/22.
//

import UIKit

class View_5: UIViewController {
    
    private let window: UIView = {
        
        let window = UIView()
        window.backgroundColor = .red
        
        return window
    }()
    
    private lazy var button: UIButton = {
        
        let button = UIButton()
        button.setImage(AppImages.chevronDown, for: .normal)
        button.setImage(AppImages.chevronUp, for: .selected)
        button.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside)
        button.tintColor = .red
        
        return button
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        view.addSubview(button)
        button.addSubview(window)
        
        super.viewDidLoad()
        
        button.constraintInsideTo(.centerX, view)
        button.constraintInsideTo(.centerY, view)
        
        window.constraintOutsideTo(.top, button)
        window.constraintInsideTo(.trailing, button)
        window.sizeAnchorInSuperview(0)
        
        button.subviews[0].backgroundColor = .black
    }
    
    @objc func buttonTarget(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        window.showLikeAWindow(size: CGSize(width: 0,
                                            height: 0),
                               height: sender.constraints[5],
                               width: sender.constraints[6])
        
        if sender.isSelected {
            
            window.showLikeAWindow(size: CGSize(width: sender.frame.size.width,
                                                height: sender.frame.size.height*5),
                                   height: sender.constraints[5],
                                   width: sender.constraints[6])
        }
    }
}
