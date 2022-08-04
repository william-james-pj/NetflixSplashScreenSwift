//
//  SlideScreen2.swift
//  NetflixSplashScreenSwift
//
//  Created by Pinto Junior, William James on 04/08/22.
//

import UIKit

class SlideScreen2: UIView {
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
    
    fileprivate let imageViewBackgroud: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let viewGradient: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    override func layoutSubviews() {
       super.layoutSubviews()
        if !(viewGradient.layer.sublayers?.first is CAGradientLayer ) {
            setGradientBackground()
        }
     }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func configView(title: String, subTitle: String, image: UIImage?) {
        self.labelTitle.text = title
        self.labelSubTitle.text = subTitle
        self.imageViewBackgroud.image = image
    }
    
    fileprivate func setGradientBackground() {
        let colorTop =  UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        let colorBottom = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom, colorTop, colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.4, 0.6, 0.9]
        gradientLayer.frame = self.viewGradient.bounds
                
        self.viewGradient.layer.insertSublayer(gradientLayer, at:0)
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(imageViewBackgroud)
        self.addSubview(viewGradient)
        self.addSubview(labelTitle)
        self.addSubview(labelSubTitle)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            imageViewBackgroud.topAnchor.constraint(equalTo: self.topAnchor),
            imageViewBackgroud.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageViewBackgroud.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageViewBackgroud.bottomAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: -8),
            
            viewGradient.topAnchor.constraint(equalTo: imageViewBackgroud.topAnchor),
            viewGradient.leadingAnchor.constraint(equalTo: imageViewBackgroud.leadingAnchor),
            viewGradient.trailingAnchor.constraint(equalTo: imageViewBackgroud.trailingAnchor),
            viewGradient.bottomAnchor.constraint(equalTo: imageViewBackgroud.bottomAnchor),
            
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            labelTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -128),
            
            labelSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            labelSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            labelSubTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -64)
        ])
    }
}
