//
//  SlideViewModel.swift
//  NetflixSplashScreenSwift
//
//  Created by Pinto Junior, William James on 03/08/22.
//

import UIKit

class SlideViewModel {
    
    init() {
    }
    
    func getScreens() -> [UIView] {
        var allScreen: [UIView] = []
        
        allScreen.append(setFirstScreen())
        allScreen.append(setSecondScreen())
        allScreen.append(setThirdScreen())
//        allScreen.append(setFourthScreen())
        
        return allScreen
    }
    
    fileprivate func setFirstScreen() -> UIView {
        let title = "Unlimeted movies, TV shows, and more."
        let subTitle = "Watch anywhere. Cancel anytime."
        let image = UIImage(named: "cardBackground")!
        
        let screen = SlideScreen2()
        screen.configView(title: title, subTitle: subTitle, image: image)
        return screen
    }
    
    fileprivate func setSecondScreen() -> UIView {
        let title = "Download your shows to watch offline"
        let subTitle = "Save your favorites easily and always have something to watch."
        let image = UIImage(named: "download")!
        
        let screen = SlideScreen1()
        screen.configView(title: title, subTitle: subTitle, image: image)
        return screen
    }
    
    fileprivate func setThirdScreen() -> UIView {
        let title = "Watch everywhere"
        let subTitle = "Stream unlimited movies and TV shoes on your phone, tablet, laptop and TV."
        let image = UIImage(named: "watch")!
        
        let screen = SlideScreen1()
        screen.configView(title: title, subTitle: subTitle, image: image)
        return screen
    }
    
    fileprivate func setFourthScreen() -> UIView {
        let title = "Create profiles for kids"
        let subTitle = "Send kids on adventures with their favorite characters in a space made just for them."
        let image = UIImage(named: "kids")!
        
        let screen = SlideScreen1()
        screen.configView(title: title, subTitle: subTitle, image: image)
        return screen
    }
}

