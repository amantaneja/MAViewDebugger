//
//  ViewConstraintView.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 12/03/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

class ViewConstraintListView: UIView {

    private var tableView = UITableView()
    private var viewModel: ConstraintListViewModel?
    
    private var model: [ConstraintListModel]
    
    init(frame: CGRect, model: [ConstraintListModel]) {
        self.model = model
        super.init(frame: frame)
        createViews()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createViews() {
        addSubview(self.tableView)
        self.tableView.frame = self.bounds
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
    }
    
    private func registerCells() {
        tableView.register(ConstraintListViewTableViewCell.self, forCellReuseIdentifier: ConstraintListViewTableViewCell.self.description())
    }
    
    private func initializeViewModel() {
        self.viewModel = ConstraintListViewModel()
    }
    
    private func addSaveButton() {
        
    }
}

extension ViewConstraintListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = viewModel?.getCellFor(tableView, at: indexPath) as? ConstraintListViewTableViewCell {
            cell.setData(data: model[indexPath.row])
        }
        
        return UITableViewCell()
    }
}
