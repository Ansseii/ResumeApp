//
//  HobbiesViewController.swift
//  ResumeApp
//
//  Created by Aleksandr on 30.08.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

import UIKit

class HobbiesViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    
    var loggedUser: User!
    var currentProfile = Profile.getInMemoryProfile()
    
    override func viewDidLoad() {
        usernameLabel.text = loggedUser.login
        hobbiesLabel.text = """
        My hobbies are \(getHobbiesAsText(profile: currentProfile)).
        """
    }
    
    private func getHobbiesAsText(profile: Profile) -> String {
        profile.hobbies.joined(separator: ", ")
    }
    
}
