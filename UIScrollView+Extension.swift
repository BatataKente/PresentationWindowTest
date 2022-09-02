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
        
        view.constraintInsideTo_Old(.top, self.contentLayoutGuide)
        view.constraintInsideTo_Old(.leading, self.contentLayoutGuide)
        view.constraintInsideTo_Old(.trailing, self.contentLayoutGuide)
        view.constraintInsideTo_Old(.bottom, self.contentLayoutGuide)
        view.constraintInsideTo_Old(.width, self.frameLayoutGuide)
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.backgroundColor = .cyan
        
        view.addSubview(stackView)
        
        stackView.constraintInsideTo_Old(.top, view)
        stackView.constraintInsideTo_Old(.leading, view)
        stackView.constraintInsideTo_Old(.trailing, view)
        stackView.constraintInsideTo_Old(.bottom, view)
    }
}
