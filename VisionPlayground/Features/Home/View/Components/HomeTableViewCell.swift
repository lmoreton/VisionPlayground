//
//  HomeTableViewCell.swift
//  VisionPlayground
//
//  Created by Mateus de Campos on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    lazy var confidenceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    lazy var itemImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
    }()
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewConfiguration()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension HomeTableViewCell {
    
    func configure(configuration: Item) {
        contentLabel.text = configuration.text
        confidenceLabel.text = configuration.confidence
        itemImageView.image = UIImage(named: configuration.image)
    }
}

extension HomeTableViewCell: ViewCoding {
    
    func buildViewHierarchy() {
        contentStackView.addArrangedSubview(contentLabel)
        contentStackView.addArrangedSubview(confidenceLabel)
        self.contentView.addSubview(contentStackView)
        self.contentView.addSubview(itemImageView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            itemImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8),
            itemImageView.heightAnchor.constraint(equalToConstant: 64),
            itemImageView.widthAnchor.constraint(equalToConstant: 64),
            contentStackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 8),
            contentStackView.centerYAnchor.constraint(equalTo: itemImageView.centerYAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ])
    }
}
