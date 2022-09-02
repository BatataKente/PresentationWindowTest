//
//  View_2.swift
//  presentation
//
//  Created by Josicleison on 11/08/22.
//

import UIKit

class View_2: UIViewController {
    
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
    
    let label: UILabel = {
        
        let label = UILabel()
        label.text = "Lero Lero"
        
        return label
    }()

    override func viewDidLoad() {
        
        view.backgroundColor = .blue
        
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Eu tenho a força",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(dismiss))
        
        view.addSubviews([button, label])
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
        
        let view_3 = View_3()
        
        sender.backgroundColor = .purple
        
        navigationController?.pushViewController(view_3, animated: true)
    }
    
    @objc private func dismiss(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
}

