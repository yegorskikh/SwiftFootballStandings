//
//  AvailableLeaguesView.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

class LeaguesView: UIView {
    
    // MARK: - Property
    
    var isShowLoader = true {
        didSet {
            isShowLoader ? startLoader() : stopLoader()
        }
    }
    
    lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LeaguesCell.self, forCellReuseIdentifier: LeaguesCell.identifier)
        tableView.layer.cornerRadius = 10
        tableView.rowHeight = 90
        return tableView
    }()
    

    
    // MARK: - Life Cycle
    
    public init() {
        super.init(frame: .zero)
        setupView()
        addSubviews()
        setStoreConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private method
    
    private func startLoader() {
        loader.isHidden = false
        loader.startAnimating()
    }
    
    private func stopLoader() {
        loader.isHidden = true
        loader.stopAnimating()
    }
    
    private func setupView() {
        self.backgroundColor = .lightGray
    }
    
    private func addSubviews() {
        self.addSubview(tableView)
        self.addSubview(loader)
    }
    
    private func setStoreConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5.0),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            
            loader.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
    
}
