//
//  SlideView.swift
//  NetflixSplashScreenSwift
//
//  Created by Pinto Junior, William James on 03/08/22.
//

import UIKit

class SlideView: UIView {
    // MARK: - Constrants    
    // MARK: - Variables
    fileprivate var viewModel = SlideViewModel()
    fileprivate var allScreen: [UIView] = []
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let collectionViewScreen: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    fileprivate let pageControlScreen: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
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
        self.allScreen = self.viewModel.getScreens()
        self.pageControlScreen.numberOfPages = self.allScreen.count
        
        buildHierarchy()
        buildConstraints()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewScreen.dataSource = self
        collectionViewScreen.delegate = self
        
        collectionViewScreen.register(ScreenCollectionViewCell.self, forCellWithReuseIdentifier: ScreenCollectionViewCell.resuseIdentifier)
    }
    
    // MARK: - Methods
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(collectionViewScreen)
        
        self.addSubview(pageControlScreen)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            pageControlScreen.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pageControlScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
}

// MARK: - extension CollectionViewDelegate
extension SlideView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       return
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / self.frame.width
        pageControlScreen.currentPage = Int(scrollPos)
    }
}

// MARK: - extension CollectionViewDataSource
extension SlideView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allScreen.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenCollectionViewCell.resuseIdentifier, for: indexPath) as! ScreenCollectionViewCell
        cell.settingCell(self.allScreen[indexPath.row])
        return cell
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension SlideView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
