//
//  ConstraintListViewTableViewCell.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 03/04/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

class ConstraintListViewTableViewCell: UITableViewCell {
    
    private var constraintName = ViewHelper.getLabel()
    
    private var isActiveSwitch: UISwitch = {
        let activeSwitch = UISwitch()
        activeSwitch.translatesAutoresizingMaskIntoConstraints = false
        return activeSwitch
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        let marginGuide = contentView.layoutMarginsGuide

        contentView.addSubview(constraintName)
        
        // configure titleLabel
        contentView.addSubview(constraintName)
        contentView.addSubview(isActiveSwitch)
        
        constraintName.translatesAutoresizingMaskIntoConstraints = false
        
        isActiveSwitch.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 10.0).isActive = true
        isActiveSwitch.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        
        constraintName.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        constraintName.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        constraintName.trailingAnchor.constraint(equalTo: isActiveSwitch.leadingAnchor, constant: -10).isActive = true
        constraintName.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -20).isActive = true
        
    }
}
