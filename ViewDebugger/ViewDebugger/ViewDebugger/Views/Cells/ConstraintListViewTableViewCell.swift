//
//  ConstraintListViewTableViewCell.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 03/04/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

class ConstraintListViewTableViewCell: UITableViewCell {
    
    private var constraintName: UILabel = {
        let constraintName = UILabel()
        constraintName.font = UIFont.boldSystemFont(ofSize: 13.0)
        constraintName.numberOfLines = 0
        constraintName.textColor = .darkGray
        return constraintName
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        
    }
    
}
