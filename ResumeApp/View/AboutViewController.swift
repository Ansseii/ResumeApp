//
//  MainViewController.swift
//  ResumeApp
//
//  Created by Aleksandr on 29.08.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var loggedUser: User!
    
    private let profile = Profile.getInMemoryProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingsLabel.text = "You logged in as \(loggedUser.login)!"
        
        summaryLabel.text =
        """
        My name is \(profile.name) \(profile.surname).
        I'm \(profile.age) years old.
        My marital status is \(profile.maritalStatus).
        I've been living in \(profile.city) for \(profile.agesCount) years
        and I've been working as \(profile.profession) since I relocated here.
        """
    }
}
