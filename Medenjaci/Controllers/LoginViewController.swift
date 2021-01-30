//
//  LoginViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit

class LoginViewController: RegistrationFlowViewController {

    // MARK: Outlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Common.login
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setUpLabels()
        setUpPlaceholders()
        setUpButtons()
    }
    
    // MARK: Interface setup
    private func setUpLabels() {
        emailLabel.text = Strings.Common.email
        passwordLabel.text = Strings.Common.password
    }
    
    private func setUpPlaceholders() {
        emailTextField.placeholder = Strings.Placeholder.email
        passwordTextField.placeholder = Strings.Placeholder.password
    }
    
    private func setUpButtons() {
        loginButton.setTitle(Strings.Common.login.uppercased(), for: .normal)
        forgotPasswordButton.setTitle(Strings.Common.forgotPassword, for: .normal)
    }

}
