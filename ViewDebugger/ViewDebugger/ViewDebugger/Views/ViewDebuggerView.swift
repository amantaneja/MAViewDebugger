//
//  ViewDebuggerView.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 11/03/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

enum ToolbarButtonType {
    case close
    case minimize
    case expand
}

protocol ViewDebuggerViewProtocol {
    func toolbarButtonTappedWith(type: ToolbarButtonType)
}

class ViewDebuggerView: UIView {
    
    var delegate: ViewDebuggerViewProtocol?
    var toolbarButtons = [ToolbarButtonType: UIButton]()
    
    private var constraintGraphView: ViewConstraintGraphView?
    private var constraintListView: ViewConstraintListView?
    private var containerView: UIView?
    
    private var isShowing: Bool = false
    
    private lazy var toolbar: UIView = {
        var toolbar = UIView()
        toolbar.addBottomBorderWithColor(color: .black, width: 1.0)
        return toolbar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 8.0
        self.backgroundColor = .white
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        createViews()
    }
    
    private func createViews() {
        addSubview(toolbar)
        toolbar.frame = CGRect(origin: self.bounds.origin, size: .init(width: self.bounds.size.width, height: 40))
        addHelpersInsideToolbar()
        createContainerView()
        createConstraintListView()
    }
    
    private func fetchModel() -> [ConstraintListModel] {
        guard let containerView = containerView else { return [] }
        let modelBuilder = ConstraintToModelBuilder(view: containerView)
        return modelBuilder.listOfConstraint
    }
    
    private func addHelpersInsideToolbar() {
        addFullScreen()
        addClose()
    }
    
    private func createContainerView() {
        containerView = UIView()
        containerView?.backgroundColor = .white
        containerView?.frame = CGRect(origin: .init(x: .zero, y: self.toolbar.bounds.maxY + 20), size: .init(width: toolbar.bounds.width, height: self.frame.height - toolbar.bounds.height))
        if let containerView = containerView {
            addSubview(containerView)
        }
    }
    
    func createViewGraphView() {
        if constraintGraphView == nil {
            constraintGraphView = ViewConstraintGraphView(frame: self.containerView?.frame ?? .zero)
            if let graphView = constraintGraphView {
                addSubview(graphView)
            }
        }
    }
    
    func createConstraintListView() {
        if constraintListView == nil {
            constraintListView = ViewConstraintListView(frame: self.containerView?.frame ?? .zero, model: fetchModel())
            if let listView = constraintListView {
                addSubview(listView)
            }
        }
    }
    
    func addFullScreen() {
        let fullScreenButton = UIButton(type: .system)
        fullScreenButton.addTarget(self, action: #selector(fullScreenTapped), for: .touchUpInside)
        fullScreenButton.tintColor = .black
        fullScreenButton.setImage(UIImage(named: "close"), for: .normal)
        toolbar.addSubview(fullScreenButton)
        fullScreenButton.frame = CGRect(origin: .init(x: toolbar.bounds.maxX - 30, y:toolbar.bounds.origin.x + 12), size: .init(width: 20, height: 20))
        
        toolbarButtons[.close] = fullScreenButton
    }
    
    @objc func fullScreenTapped() {
        delegate?.toolbarButtonTappedWith(type: .close)
    }
    
    func addClose() {
        let fullScreenButton = UIButton(type: .system)
        fullScreenButton.addTarget(self, action: #selector(fullScreenTapped), for: .touchUpInside)
        fullScreenButton.tintColor = .black
        fullScreenButton.setImage(UIImage(named: "close"), for: .normal)
        toolbar.addSubview(fullScreenButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
