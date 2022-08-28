//
//  View_4.swift
//  presentation
//
//  Created by Josicleison on 13/08/22.
//

import UIKit

class View_4: UIViewController {
    
    let coverView: UIView = {
        
        let coverView = UIView()
        coverView.backgroundColor = .red
        coverView.alpha = 0
        
        return coverView
    }()
    
    private lazy var imageView: UIImageView = {
        
        let imageView = UIImageView(frame: CGRect(origin: .zero,
                                                  size: CGSize(width: view.frame.size.width*0.4,
                                                               height: view.frame.size.width*0.4)))
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "caveira")
        
        return imageView
    }()
    
    private let button = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubviews([button, coverView, imageView])
        
        button.setToBottomButtonKeyboardDefault()
        
        coverView.fillSuperview()
        
        button.addSubWindow(imageView, .alert)
        button.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside)
    }
    
    @objc func buttonTarget(_ sender: UIButton) {
        
        if sender.isSelected {
            
            coverView.alpha = 0
        }
        else {
            
            coverView.alpha = 0.75
        }
    }
}
