//
//  OnboardingViewController.swift
//  NetflixSplashScreenSwift
//
//  Created by Pinto Junior, William James on 03/08/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    // MARK: - Variables
    // MARK: - Constantes
    fileprivate let splashView : SplashScreenView = {
        let splash = SplashScreenView()
        return splash
    }()
    
    fileprivate let imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoN")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let labelPrivacy: UILabel = {
        let label = UILabel()
        label.text = "PRIVACY"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelSignIn: UILabel = {
        let label = UILabel()
        label.text = "SIGN IN"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackBaseAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewSlide : SlideView = {
        let slide = SlideView()
        slide.translatesAutoresizingMaskIntoConstraints = false
        return slide
    }()
    
    fileprivate let viewButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let buttonStart: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET STARTED", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(named: "Primary")
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        view.backgroundColor = UIColor(named: "Backgroud")
        
        self.splashView.delegate = self
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(viewSlide)
        stackBase.addArrangedSubview(viewButtonContainer)
        viewButtonContainer.addSubview(buttonStart)
        
        view.addSubview(imageViewLogo)
        view.addSubview(labelPrivacy)
        view.addSubview(labelSignIn)
        
        view.addSubview(splashView)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            
            viewButtonContainer.heightAnchor.constraint(equalToConstant: 45),
            buttonStart.heightAnchor.constraint(equalToConstant: 45),
            buttonStart.centerYAnchor.constraint(equalTo: viewButtonContainer.centerYAnchor),
            buttonStart.leadingAnchor.constraint(equalTo: viewButtonContainer.leadingAnchor, constant: 8),
            buttonStart.trailingAnchor.constraint(equalTo: viewButtonContainer.trailingAnchor, constant: -8),
            
            imageViewLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageViewLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            imageViewLogo.widthAnchor.constraint(equalToConstant: 30),
            imageViewLogo.heightAnchor.constraint(equalToConstant: 30),
            
            labelPrivacy.centerYAnchor.constraint(equalTo: imageViewLogo.centerYAnchor),
            labelPrivacy.trailingAnchor.constraint(equalTo: labelSignIn.leadingAnchor, constant: -16),
//
            labelSignIn.centerYAnchor.constraint(equalTo: imageViewLogo.centerYAnchor),
            labelSignIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            
            splashView.topAnchor.constraint(equalTo: view.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension OnboardingViewController: SplashScreenViewDelegate {
    func splashFinished() {
        self.splashView.isHidden = true
    }
}
