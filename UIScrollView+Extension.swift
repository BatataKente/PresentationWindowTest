//
//  UIScrollView+extension.swift
//  presentation
//
//  Created by Josicleison on 13/08/22.
//

import UIKit

extension UIScrollView {
    
    func turnIntoAList(_ views: [UIView]) {
        
        let view = UIView()
        self.addSubview(view)
        
        view.constraintInsideTo(.top, self.contentLayoutGuide)
        view.constraintInsideTo(.leading, self.contentLayoutGuide)
        view.constraintInsideTo(.trailing, self.contentLayoutGuide)
        view.constraintInsideTo(.bottom, self.contentLayoutGuide)
        view.constraintInsideTo(.width, self.frameLayoutGuide)
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.backgroundColor = .cyan
        
        view.addSubview(stackView)
        
        stackView.constraintInsideTo(.top, view)
        stackView.constraintInsideTo(.leading, view)
        stackView.constraintInsideTo(.trailing, view)
        stackView.constraintInsideTo(.bottom, view)
    }
}
