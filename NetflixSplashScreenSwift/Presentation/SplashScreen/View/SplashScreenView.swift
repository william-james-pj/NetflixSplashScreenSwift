//
//  SplashScreenView.swift
//  NetflixSplashScreenSwift
//
//  Created by Pinto Junior, William James on 03/08/22.
//

import UIKit

protocol SplashScreenViewDelegate {
    func splashFinished()
}

class SplashScreenView: UIView {
    // MARK: - Variables
    fileprivate var animationFinished : Bool = false
    var delegate: SplashScreenViewDelegate?
    
    // MARK: - Constantes
    fileprivate let imageViewAnimation: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let imageViewFinished: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        self.backgroundColor = UIColor(named: "Backgroud")
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let image = getLogoURL(resourceName: "logoAnimation") {
            self.imageViewAnimation.animationImages = image
            self.imageViewAnimation.animationDuration = 1.86
            self.imageViewAnimation.startAnimating()
            setStartAnimation()
        }
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    fileprivate func setStartAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.60) {
            self.setImageFinished()
            self.animationFinished = true
            self.imageViewAnimation.stopAnimating()
            self.setEndAnimation()
        }
    }
    
    fileprivate func setEndAnimation() {
        UIView.animate(withDuration: 0.7, delay: 0.4, options: .curveEaseInOut, animations: {
            self.layer.opacity = 0
        }) { _ in
            self.delegate?.splashFinished()
        }
    }
    
    fileprivate func setImageFinished() {
        self.imageViewFinished.isHidden = false
        self.imageViewAnimation.isHidden = true
    }
    
    fileprivate func getLogoURL(resourceName: String) -> [UIImage]? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
            let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        return images
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(imageViewAnimation)
        self.addSubview(imageViewFinished)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            imageViewAnimation.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageViewAnimation.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageViewAnimation.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            imageViewFinished.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageViewFinished.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageViewFinished.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
