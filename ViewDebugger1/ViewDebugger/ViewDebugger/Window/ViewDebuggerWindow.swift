//
//  ViewDebuggerWindow.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 06/03/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

class FloatingButtonWindow: UIWindow {
    
    var viewDebugger: ViewDebuggerView?
    var parentView = UIView()
    
    private(set) public var isVisible: Bool = true {
        willSet {
            isHidden = !newValue
        }
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = nil
        windowLevel = .alert
        isHidden = false
        
        setupDebuggerView()
    }
    
    func setupDebuggerView() {
        viewDebugger = ViewDebuggerView(frame: .init(origin: .init(x: 62, y: 200), size: .init(width: 300, height: 400)))
        viewDebugger?.delegate = self
        if let view = viewDebugger {
            parentView.addSubview(view)
        }
        
        let panner = UIPanGestureRecognizer(target: self, action: #selector(panDidFire(panner:)))
        viewDebugger?.addGestureRecognizer(panner)
    }
    
    @objc func panDidFire(panner: UIPanGestureRecognizer) {
        let offset = panner.translation(in: parentView)
        panner.setTranslation(CGPoint.zero, in: parentView)
        var center = viewDebugger?.center
        center?.x += offset.x
        center?.y += offset.y
        viewDebugger?.center = center ?? CGPoint.zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let view = viewDebugger else { return false }
        let buttonPoint = convert(point, to: view)
        return view.point(inside: buttonPoint, with: event)
    }
}

extension FloatingButtonWindow: ViewDebuggerViewProtocol {
    func toolbarButtonTappedWith(type: ToolbarButtonType) {
        switch type {
        case .close:
            isVisible = false
        default:
            break
        }
    }
    
    
}
