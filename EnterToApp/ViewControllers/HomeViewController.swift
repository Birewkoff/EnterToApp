//
//  HomeViewController.swift
//  EnterToApp
//
//  Created by Артур Бирюков on 30.05.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var smileLabel: UILabel!
    
    // MARK: - Identifiers
    var user = ""
    private let smile = ["🤑", "📚", "💰", "📉", "🪒", "🐹"]
    var currentIndex = 0
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // передача имени
        if let tabBarController = self.tabBarController as? MainTabBarController,
           let person = tabBarController.person {
            user = person.firstName
        }
        // установка текста Label
        welcomeLabel.text = "Welcome, \(user)!"
        // установка фона
        setupGradient()
        // таймер для смайлов
        smileLabel.text = smile[currentIndex]
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { 
            [weak self] timer in self?.updateSmile()
        }
        
    }
    
    // MARK: - Log Out Button Tapped
    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let startViewController = storyboard.instantiateViewController(withIdentifier: "StartViewController")
            
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
                window.rootViewController = startViewController
                
            let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
                    
            UIView.transition(
                with: window,
                duration: 0.75,
                options: transitionOptions,
                animations: nil,
                completion: nil)
        }
    }
    // MARK: - Update Smile
    private func updateSmile() {
        currentIndex = (currentIndex + 1) % smile.count
        
        UIView.transition(
            with: smileLabel,
            duration: 0.5,
            options: .transitionFlipFromLeft,
            animations: {
                    self.smileLabel.text = self.smile[self.currentIndex]
                },
            completion: nil)
    }
}

extension UIViewController {
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [
            UIColor.blue.cgColor,
            UIColor.white.cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0.7, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)
                
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
