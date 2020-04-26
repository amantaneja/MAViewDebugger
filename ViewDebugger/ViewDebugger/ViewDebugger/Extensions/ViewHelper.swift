//
//  ViewHelper.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 26/04/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import Foundation
import UIKit

class ViewHelper {
    
    static func getLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func getImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static func getTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorColor = .clear
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }

    static func getView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    static func getButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
