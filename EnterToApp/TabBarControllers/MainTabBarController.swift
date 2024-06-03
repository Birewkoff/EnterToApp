//
//  MainTabBarController.swift
//  EnterToApp
//
//  Created by Артур Бирюков on 31.05.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        person = Person(
            firstName: "Джони",
            lastName: "Бамбони",
            company: "Пинцетный захват",
            department: "Крипто аналитик",
            position: "CEO хомяков"
        )
    }
}
