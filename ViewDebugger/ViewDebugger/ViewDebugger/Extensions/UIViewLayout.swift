//
//  UIViewLayout.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 26/04/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

extension UIView {
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    func alignCenter() {
        alignVertical()
        alignHorizontal()
    }
    
    func alignVertical() {
        guard let superView = self.superview else { return }
        centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
    
    func alignHorizontal() {
        guard let superView = self.superview else { return }
        centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: margin > 0 ? margin : paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: margin > 0 ? margin : paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: margin > 0 ? margin : paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: margin > 0 ? -margin : -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setRounded() {
        if width == 0, height == 0 {
            layoutIfNeeded()
        }
        frame.size.width >= frame.size.height ? setRoundedByWidth() : setRoundedByHeight()
    }
    
    func setRoundedByHeight() {
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
    }
    
    func setRoundedByWidth() {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
    }
}
