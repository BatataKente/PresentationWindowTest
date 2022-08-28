//
//  View_3.swift
//  presentation
//
//  Created by Josicleison on 11/08/22.
//

import UIKit

class View_3: UIViewController {
    
    private lazy var button: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .cyan
        button.setTitle("Hey cara que isso rapaz...", for: .normal)
        
        button.addTarget(self,
                         action: #selector(buttonTarget),
                         for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        
        view.backgroundColor = .green
        
        super.viewDidLoad()
        
        view.addSubview(button)
        view.addConstraints([
        
            NSLayoutConstraint(item: button,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: button,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0)
        ])
    }
    
    @objc private func buttonTarget(_ sender: UIButton) {
        
    }
}

