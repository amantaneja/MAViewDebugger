//
//  ViewConstraintGraphView.swift
//  ViewDebugger1
//
//  Created by Aman Taneja on 12/03/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

class ViewConstraintGraphView: UIView {
    
    private struct Constants {
        static let centerViewSize:CGSize = .init(width: 30, height: 30)
    }
    
    lazy private var centerView: UIView = {
        let centerView = UIView()
        centerView.layer.borderColor = UIColor.darkGray.cgColor 
        centerView.layer.borderWidth = 0.5
        centerView.layer.cornerRadius = 4.0
        return centerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {
        addSubview(centerView)
        centerView.frame.size = Constants.centerViewSize
        centerView.center = self.center - self.frame.origin
        
        createDirectionalViews()
    }
    
    func createDirectionalViews() {
        
        let frame = CGRect(x: centerView.frame.origin.x,
                           y: centerView.center.y + 10,
                           width: centerView.bounds.size.width,
                           height: 80)
        
        let topConstraintLine = ViewConstraintListDirectionalView(direction: .top, constant: -1, frame: frame)
        addSubview(topConstraintLine)
    }
    
}
