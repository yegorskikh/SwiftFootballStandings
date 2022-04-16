//
//  AvailableLeaguesCell.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

class LeaguesCell: UITableViewCell {
    
    // MARK: - Property
    
    static let identifier = "LeaguesCell"

    lazy var logoLeagueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }() 
    
    lazy var titleLeagueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Medium", size: 12)
        return label
    }()
    
    lazy var abbrLeagueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Bold", size: 14)
        return label
    }()
    
    // MARK: - Lifecycle
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        logoLeagueImageView.image = nil
    }
    
    // MARK: - Internal method logoLeague: UIImage,
    
    func setupCell(titleLeague: String, abbrLeague: String, imageUrl: String) {
        logoLeagueImageView.loadImage(urlString: imageUrl)
        titleLeagueLabel.text = titleLeague
        abbrLeagueLabel.text = abbrLeague
    }
    
    // MARK: - Private method
    private func addSubviews() {
        contentView.addSubview(logoLeagueImageView)
        contentView.addSubview(titleLeagueLabel)
        contentView.addSubview(abbrLeagueLabel)
    }
    
    private func setStoreConstraints() {

        NSLayoutConstraint.activate([
            logoLeagueImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoLeagueImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoLeagueImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            logoLeagueImageView.widthAnchor.constraint(equalToConstant: 100.0),
            
            abbrLeagueLabel.leadingAnchor.constraint(equalTo: logoLeagueImageView.trailingAnchor, constant: 5.0),
            abbrLeagueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            abbrLeagueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0),

            titleLeagueLabel.topAnchor.constraint(equalTo: abbrLeagueLabel.bottomAnchor),
            titleLeagueLabel.leadingAnchor.constraint(equalTo: logoLeagueImageView.trailingAnchor, constant: 5.0),
            titleLeagueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0),
            titleLeagueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0),
        ])
    }
    
}
