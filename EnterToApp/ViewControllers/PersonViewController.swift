//
//  PersonViewController.swift
//  EnterToApp
//
//  Created by Артур Бирюков on 30.05.2024.
//

import UIKit

final class PersonViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var avatarImage: UIImageView!
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabBarController = self.tabBarController as? MainTabBarController,
           let person = tabBarController.person {
            firstNameLabel.text = person.firstName
            lastNameLabel.text = person.lastName
            companyLabel.text = person.company
            departmentLabel.text = person.department
            positionLabel.text = person.position
            
            self.navigationItem.title = "\(person.firstName) \(person.lastName)"
        }
        
        makeImageCircular(avatarImage)
        setupGradient()
    }
    
    // MARK: - Make Image Circular
    func makeImageCircular(_ imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }
}
