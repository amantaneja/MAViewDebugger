//
//  ConstraintListViewModel.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 03/04/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import Foundation
import UIKit

struct ConstraintListModel {
    var name: String?
    var isEnabled: Bool?
    var constant: CGFloat?
    var wrtView: UIView?
}

class ConstraintListViewModel {
    
    private func getVMForRowAt(index: IndexPath) {
        
    }
    
    func getCellFor(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ConstraintListViewTableViewCell.self.description(), for: indexPath) as? ConstraintListViewTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
    func getNumberOfRowsIn(section: Int) -> Int {
        return 10
    }
    
    
    
}
