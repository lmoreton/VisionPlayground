//
//  OCRViewController.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 02/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class OCRViewController: UIViewController {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    lazy var scanButton: UIButton = {
        let button = UIButton(frame: .zero)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Scan", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 7.0
        button.backgroundColor = .systemIndigo
        
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(frame: .zero)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 7.0
        button.backgroundColor = .systemGray
        button.isEnabled = false
        
        return button
    }()
    
    lazy var scanImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.systemIndigo.cgColor
        imageView.backgroundColor = .secondarySystemBackground
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var ocrTextView: UITextView = {
        let textView = UITextView(frame: .zero, textContainer: nil)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 7.0
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.systemIndigo.cgColor
        textView.textColor = .label
        textView.font = .systemFont(ofSize: 16.0)
        textView.isUserInteractionEnabled = false
        
        return textView
    }()
    
    var viewModel: OCRViewModelProtocol
    
    init(viewModel: OCRViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewConfiguration()
    }
    
    private func configureActions() {
        scanButton.addTarget(self, action: #selector(scanDocument), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveNewItem), for: .touchUpInside)
    }
    
    @objc private func saveNewItem() {
        viewModel.saveNewItem()
    }
    
    @objc private func scanDocument() {
        viewModel.scanDocument()
    }
}

extension OCRViewController: ViewCoding {
    func buildViewHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(scanButton)
        stackView.addArrangedSubview(saveButton)
        
        view.addSubview(scanImageView)
        view.addSubview(ocrTextView)
    }
    
    func setupConstraints() {
        let padding: CGFloat = 16
        
        stackView.constraint { view in
            return [
                view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
                view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
            ]
        }
        
        scanButton.constraint { view in
            return [ view.heightAnchor.constraint(equalToConstant: 50) ]
        }
        
        saveButton.constraint { view in
            return [ view.heightAnchor.constraint(equalToConstant: 50) ]
        }
        
        ocrTextView.constraint { view in
            return [
                view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
                view.bottomAnchor.constraint(equalTo: self.scanButton.topAnchor, constant: -padding),
                view.heightAnchor.constraint(equalToConstant: 200)
            ]
        }
        
        scanImageView.constraint { view in
            return [
                view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: padding),
                view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
                view.bottomAnchor.constraint(equalTo: self.ocrTextView.topAnchor, constant: -padding)
            ]
        }
    }
    
    func configureViews() {
        view.backgroundColor = .systemBackground
        
        configureActions()
    }
}
