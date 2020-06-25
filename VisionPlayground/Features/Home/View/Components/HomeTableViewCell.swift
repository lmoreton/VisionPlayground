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
        image.clipsToBounds = true
        image.backgroundColor = .gray
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
    
    func configureViews() {
//        selectionStyle = .none
    }
    
    func buildViewHierarchy() {
        contentStackView.addArrangedSubview(contentLabel)
        contentStackView.addArrangedSubview(confidenceLabel)
        self.contentView.addSubview(contentStackView)
        self.contentView.addSubview(itemImageView)
    }
    
    func setupConstraints() {
        
        itemImageView.constraint { view in
            return [
                view.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
                view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
                view.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -8),
                view.heightAnchor.constraint(equalTo: view.widthAnchor),
                view.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.35),
            ]
        }
        
        contentStackView.constraint { view in
            return [
                view.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 8),
                view.centerYAnchor.constraint(equalTo: itemImageView.centerYAnchor),
                view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
            ]
        }
    }
}
