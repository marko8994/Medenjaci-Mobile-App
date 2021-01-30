//
//  ViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 22/01/2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var existingAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpLabels()
        setUpButtons()
    }
    
    private func setUpNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setUpLabels() {
        welcomeLabel.text = Strings.Welcome.title
        descriptionLabel.text = Strings.Welcome.description
        existingAccountLabel.text = Strings.Welcome.existingAccount
    }
    
    private func setUpButtons() {
        registerButton.setTitle(Strings.Common.register.uppercased(), for: .normal)
        loginButton.setTitle(Strings.Common.login.uppercased(), for: .normal)
    }
}

