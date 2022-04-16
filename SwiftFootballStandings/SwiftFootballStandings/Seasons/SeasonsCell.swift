//
//  SeasonsCell.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

class SeasonsCell: UITableViewCell {
    
    // MARK: - Property
    
    static let identifier = "SeasonsCell"
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [displayNameLabel,
                                                       yearLabel,
                                                       startDateLabel,
                                                       endDateLabel])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 10)
        return label
    }()
    
    lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 10)
        return label
    }()
    
    lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 10)
        return label
    }()
    
    lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Bold", size: 14)
        label.backgroundColor = .lightGray
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setStoreConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
        setStoreConstraints()
    }
    // MARK: - Internal method
    
    func configureCell(name: String, year: Int, startDate: String, endDate: String) {
        self.displayNameLabel.text = name
        self.yearLabel.text = year.description
        self.startDateLabel.text = "START - \(startDate.prefix(10))"
        self.endDateLabel.text = "END - \(endDate.prefix(10))"
    }
    
    // MARK: - Private method
    
    private  func addSubviews() {
        contentView.addSubview(stackView)
    }
    
    private func setStoreConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
