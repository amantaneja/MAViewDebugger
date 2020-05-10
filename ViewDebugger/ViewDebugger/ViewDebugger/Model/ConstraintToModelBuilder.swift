//
//  ConstraintToModelBuilder.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 10/05/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

class ConstraintToModelBuilder {

    let view: UIView
    var listOfConstraint: [ConstraintListModel]
    
    
    init(view: UIView) {
        self.view = view
        self.listOfConstraint = []
        convertToModel()
    }
    
    private func convertToModel() {
        let constraints = view.getAllConstraints()
        for view in constraints {
            var model = ConstraintListModel()
            model.constant = view.constant
            model.isEnabled = view.isActive
            listOfConstraint.append(model)
        }
    }
}
