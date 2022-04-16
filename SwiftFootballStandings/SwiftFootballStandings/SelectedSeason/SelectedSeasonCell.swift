//
//  SelectedSeasonCell.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

class SelectedSeasonCell: UITableViewCell {
    
    // MARK: - Property
    
    static let identifier = "SelectedSeasonCell"
    
    lazy var logoTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var titleTeamLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Bold", size: 15)
        label.text = "Arsenal"
        return label
    }()
    
    lazy var pointLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
        logoTeamImageView.image = nil
    }
    
    // MARK: - Internal method
    
    func configureCell(urlImage: String, titleTeam: String, point: String) {
        self.logoTeamImageView.loadImage(urlString: urlImage)
        self.titleTeamLabel.text = titleTeam
        self.pointLabel.text = point
    }
    
    // MARK: - Private method
    
    private func addSubviews() {
        contentView.addSubview(logoTeamImageView)
        contentView.addSubview(titleTeamLabel)
        contentView.addSubview(pointLabel)
    }
    
    private func setStoreConstraints() {

        NSLayoutConstraint.activate([
            logoTeamImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoTeamImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoTeamImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            logoTeamImageView.widthAnchor.constraint(equalToConstant: 100.0),

            titleTeamLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleTeamLabel.leadingAnchor.constraint(equalTo: logoTeamImageView.trailingAnchor, constant: -50.0),
            titleTeamLabel.trailingAnchor.constraint(equalTo: pointLabel.trailingAnchor, constant: -5.0),
            titleTeamLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            
            pointLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            pointLabel.leadingAnchor.constraint(equalTo: titleTeamLabel.trailingAnchor, constant: -30.0),
            pointLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0),
            pointLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
        ])
    }
}
