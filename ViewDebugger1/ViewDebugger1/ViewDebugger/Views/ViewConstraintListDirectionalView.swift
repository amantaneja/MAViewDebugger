//
//  ViewConstraintListDirectionalView.swift
//  ViewDebugger1
//
//  Created by Aman Taneja on 12/03/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

public enum ConstraintDirection {
    case left
    case right
    case top
    case bottom
}

class ViewConstraintListDirectionalView: UIView {
    
    private struct Constants {
        static var constraintButtonPadding = 6.0
        static var constraintButtonLength = 50.0
        static var constraintButtonWidth = 40.0
    }
    
    private var constraintDirection: ConstraintDirection
    private var constant: CGFloat
    
    public var textView: UITextField = {
        let textView = UITextField(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 30)))
        textView.layer.borderWidth = 1.0
        textView.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        textView.textAlignment = .center
        return textView
    }()
    
    public var constraintButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "washed"), for: . normal)
        button.addTarget(self, action: #selector(didTapConstraintButton), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    override init(frame: CGRect) {
        self.constraintDirection = .left
        self.constant = 0
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(direction: ConstraintDirection, constant: CGFloat, frame: CGRect) {
        self.constant = constant
        self.constraintDirection = direction
        super.init(frame: frame)
        
        createViews()
    }
    
    func createViews() {
        addSubview(textView)
        addSubview(constraintButton)
        
        if self.constraintDirection == .bottom {
            
        }
        
        if self.constraintDirection == .left {
            self.constraintButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }
        
        if self.constraintDirection == .top {
            
            self.constraintButton.frame = CGRect(x: 0,
                                                 y: 0,
                                                 width: self.bounds.size.width,
                                                 height: self.bounds.size.height)
            
            self.textView.center = CGPoint(x: self.constraintButton.center.x,
                                           y: CGFloat(15.0) + CGFloat(Constants.constraintButtonPadding) + CGFloat(self.constraintButton.frame.maxY))
            
            constraintButton.constraintDirection = .top
        }
        
        if self.constraintDirection == .right {
            self.constraintButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }
    }
    
    @objc func didTapConstraintButton() {
        switch constraintButton.constraintDirection {
        case .top:
            print("hi")
        case .bottom:
            print("")
        case .left:
            print("a")
        case .right:
            print("asd")
        }
    }
}
