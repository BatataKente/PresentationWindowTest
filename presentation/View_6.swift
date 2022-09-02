//
//  View_6.swift
//  presentation
//
//  Created by Josicleison on 02/09/22.
//

import UIKit

class View_6: UIViewController {
    
    private let button: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .gray
        
        return button
    }()
    
    private let mrMadrugaPhoto: UIImageView = {
        
        let mrMadrugaPhoto = UIImageView()
        mrMadrugaPhoto.image = AppImages.mrMadruga
        mrMadrugaPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        return mrMadrugaPhoto
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        view.addSubviews([mrMadrugaPhoto, button])
        
        mrMadrugaPhoto.tie(to: view, attributes: [.centerX, .centerY])
        mrMadrugaPhoto.constraint(to: view, by: .height, multiplier: 0.25)
        mrMadrugaPhoto.constraint(to: mrMadrugaPhoto, by: .width, .height, multiplier: 1.5)
        
        button.constraint(to: mrMadrugaPhoto, by: .top, .bottom, constant: 50)
        button.constraint(to: mrMadrugaPhoto, by: .centerX)
        button.shape(size: 50)
    }
}
