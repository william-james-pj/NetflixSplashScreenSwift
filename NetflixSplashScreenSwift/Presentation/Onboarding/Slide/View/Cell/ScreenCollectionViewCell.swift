//
//  ScreenCollectionViewCell.swift
//  NetflixSplashScreenSwift
//
//  Created by Pinto Junior, William James on 03/08/22.
//

import UIKit

class ScreenCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    static let resuseIdentifier: String = "ScreenCollectionViewCell"

    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func settingCell(_ screen: UIView) {
        stackBase.addArrangedSubview(screen)
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -0),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -0),
        ])
    }
}
