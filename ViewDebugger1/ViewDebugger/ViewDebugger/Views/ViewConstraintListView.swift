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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeViewModel()
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
        self.tableView.estimatedRowHeight = 70
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
        viewModel?.getNumberOfRowsIn(section: section) ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel?.getCellFor(tableView, at: indexPath) ?? UITableViewCell()
    }
}
