//
//  ViewController.swift
//  presentation
//
//  Created by Josicleison on 11/08/22.
//

import UIKit

class View_1: UIViewController {
    
    private lazy var button: UIButton = {
        
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .green
        
        let handler = {(action: UIAction) in
            
//            self.scrollView.showLikeAWindow(size: CGSize(width: button.frame.size.width,
//                                                         height: 100),
//                                            origin: self.view.center,
//                                            .alert)
        }
        
        button.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var presentButton: UIButton = {
        
        let presentButton = UIButton()
        presentButton.backgroundColor = .brown
        
        let handler = {(action: UIAction) in
            
            let view_2 = View_2()
            view_2.title = "Farofa"
            
            let navigationController = UINavigationController(rootViewController: view_2)
            navigationController.modalPresentationStyle = .fullScreen
            
            self.present(navigationController, animated: true)
        }
        
        presentButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return presentButton
    }()
    
    private lazy var scrollView: UIScrollView = {

        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue

        let buttons = [UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton()]

        for button in buttons {

            let handler = {(action: UIAction) in

                self.button.setTitle(button.currentTitle, for: .normal)
                scrollView.frame.size = .zero
            }

            button.setTitle("coisas", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
        }

        scrollView.turnIntoAList(buttons)

        return scrollView
    }()

    override func viewDidLoad() {
        
        view.backgroundColor = .red
        
        super.viewDidLoad()
        
        view.addSubviews([button, presentButton, scrollView])
        
        presentButton.constraintInsideTo(.centerX, view)
        presentButton.constraintInsideTo(.top, view, view.frame.size.height/4)
        
        button.constraintInsideTo(.centerX, view)
        button.constraintInsideTo(.centerY, view, view.frame.size.height/4)
        
//        scrollView.constraintOutsideTo(.top, button)
//        scrollView.constraintInsideTo(.leading, button)
        
//        button.addSubWindow(scrollView, .alert)
    }
}

extension View_1: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = .red
            }
        }
    }
}
