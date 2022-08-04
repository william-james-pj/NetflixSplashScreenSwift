//
//  SlideScreen1.swift
//  NetflixSplashScreenSwift
//
//  Created by Pinto Junior, William James on 03/08/22.
//

import UIKit

class SlideScreen1: UIView {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewPrimary: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelSubTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func configView(title: String, subTitle: String, image: UIImage) {
        self.labelTitle.text = title
        self.labelSubTitle.text = subTitle
        self.imageViewPrimary.image = image
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(imageViewPrimary)
        self.addSubview(labelTitle)
        self.addSubview(labelSubTitle)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            imageViewPrimary.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageViewPrimary.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageViewPrimary.bottomAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -64),
            imageViewPrimary.heightAnchor.constraint(equalToConstant: 250),
            
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            labelTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -128),
            
            labelSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            labelSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            labelSubTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -64)
        ])
    }
}

