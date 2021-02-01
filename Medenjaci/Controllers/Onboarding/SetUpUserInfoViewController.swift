//
//  RegistrationViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 27/01/2021.
//

import UIKit

class SetUpUserInfoViewController: RegistrationFlowViewController {

    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordContainer: UIView!
    @IBOutlet weak var repeatPasswordContainer: UIView!
    
    var isRegisterScreen = true
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        setUpPlaceholders()
        registerForNotifications()
        if isRegisterScreen {
            title = Strings.Title.register
            registerButton.setTitle(Strings.Title.register.uppercased(), for: .normal)
        } else {
            title = Strings.Title.changePersonalInfo
            passwordContainer.isHidden = true
            repeatPasswordContainer.isHidden = true
            registerButton.setTitle(Strings.Title.changePersonalInfo.uppercased(), for: .normal)
        }
    }
    
    // MARK: Interface setup
    private func setUpLabels() {
        nameLabel.text = Strings.Common.name
        emailLabel.text = Strings.Common.email
        addressLabel.text = Strings.Common.address
        phoneNumberLabel.text = Strings.Common.phoneNumber
        passwordLabel.text = Strings.Common.password
        repeatPasswordLabel.text = Strings.Common.repeatPassword
    }
    
    private func setUpPlaceholders() {
        nameTextField.placeholder = Strings.Placeholder.name
        emailTextField.placeholder = Strings.Placeholder.email
        addressTextField.placeholder = Strings.Placeholder.address
        phoneNumberTextField.placeholder = Strings.Placeholder.phoneNumber
        passwordTextField.placeholder = Strings.Placeholder.password
        repeatPasswordTextField.placeholder = Strings.Placeholder.repeatPassword
    }
}
