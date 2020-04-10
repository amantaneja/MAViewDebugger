//
//  ViewDebuggerExtensions.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 05/03/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit
import QuartzCore

extension UIView {
    
    func getAllConstraints() -> [NSLayoutConstraint] {
        
        var views = [self]
        
        var view = self
        while let superview = view.superview {
            views.append(superview)
            view = superview
        }
        
        // transform views to constraints and filter only those
        // constraints that include the view itself
        return views.flatMap({ $0.constraints }).filter { constraint in
            return constraint.firstItem as? UIView == self ||
                constraint.secondItem as? UIView == self
        }
    }
    
    //Stored Property in UIView. Currently this works on only one instance of the View. (Mark it with the view description if needed unique for every instance)
    struct ViewPropertyHolder {
        static var isTouchesEnabled:Bool = false
        static var touchDownTimer: TimeInterval = 0.0
    }
    
    var isTouchesEnabled:Bool {
        get {
            return ViewPropertyHolder.isTouchesEnabled
        }
        set(newValue) {
            ViewPropertyHolder.isTouchesEnabled = newValue
        }
    }
    
    var touchDownTimer: TimeInterval {
        get {
            return ViewPropertyHolder.touchDownTimer
        }
        set(newValue) {
            ViewPropertyHolder.touchDownTimer = newValue
        }
    }
}

extension CGPoint {
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        var resultantPoint = CGPoint.zero
        resultantPoint.x = lhs.x - rhs.x
        resultantPoint.y = lhs.y - rhs.y
        return resultantPoint
    }
}

extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}


extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}


extension NSLayoutConstraint {
    func isFirstItemConstraintWith(view: UIView) -> NSLayoutConstraint.Attribute {
        if self.firstItem as? UIView == view {
            return self.firstAttribute
        }
        return .notAnAttribute
    }
    
    func isSecondItemConstraintWith(view: UIView) -> NSLayoutConstraint.Attribute {
        if self.secondItem as? UIView == view {
            return self.secondAttribute
        }
        return .notAnAttribute
    }
    
    func hasConstraint(type: NSLayoutConstraint.Attribute, view: UIView) -> NSLayoutConstraint? {
        guard self.isSecondItemConstraintWith(view: view) == type || self.isFirstItemConstraintWith(view: view) == type else { return nil }
        return self
    }
}

extension UIButton {
    struct direction {
        static var constraintDirection = [String:ConstraintDirection]()
    }
    
    var constraintDirection:ConstraintDirection {
        get {
            return direction.constraintDirection[self.debugDescription] ?? .left
        }
        set(newValue) {
            direction.constraintDirection[self.debugDescription] = newValue
        }
    }
}
