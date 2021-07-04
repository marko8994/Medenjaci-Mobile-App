//
//  RegistrationViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 27/01/2021.
//

import UIKit
import Toaster

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
    @IBOutlet weak var setUpPersonalInfoButton: UIButton!
    @IBOutlet weak var passwordContainer: UIView!
    @IBOutlet weak var repeatPasswordContainer: UIView!
    
    var isRegisterScreen = true
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        setUpPlaceholders()
        registerForNotifications()
        setUpInterface()
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
    
    private func setUpInterface() {
        if isRegisterScreen {
            title = Strings.Title.register
            setUpPersonalInfoButton.setTitle(Strings.Title.register.uppercased(), for: .normal)
        } else {
            title = Strings.Title.changePersonalInfo
            passwordContainer.isHidden = true
            repeatPasswordContainer.isHidden = true
            setUpPersonalInfoButton.setTitle(Strings.Title.changePersonalInfo.uppercased(), for: .normal)
            guard let user = MockData.shared.currentUser else { return }
            nameTextField.text = user.name
            emailTextField.text = user.email
            addressTextField.text = user.email
            phoneNumberTextField.text = user.phoneNumber
        }
    }
    
    @IBAction func setUpPersonalInfoButtonAction(_ sender: Any) {
        guard let name = nameTextField.text, name.isValidName else {
            let alert = UIAlertController(title: Strings.Alert.Title.invalidName,
                                          message: Strings.Alert.Message.invalidName)
            present(alert, animated: false)
            return
        }
        guard let email = emailTextField.text, email.isValidEmail else {
            let alert = UIAlertController(message: Strings.Alert.Message.invalidEmail)
            present(alert, animated: false)
            return
        }
        guard let address = addressTextField.text, address.isValidAddress else {
            let alert = UIAlertController(title: Strings.Alert.Title.invalidAddress,
                                          message: Strings.Alert.Message.invalidAddress)
            present(alert, animated: false)
            return
        }
        guard let phoneNumber = phoneNumberTextField.text, phoneNumber.isValidPhoneNumber else {
            let alert = UIAlertController(title: Strings.Alert.Title.invalidPhoneNumber,
                                          message: Strings.Alert.Message.invalidPhoneNumber)
            present(alert, animated: false)
            return
        }
        if isRegisterScreen {
            guard let password = passwordTextField.text, let repeatedPassword = repeatPasswordTextField.text,
                  password == repeatedPassword else {
                let alert = UIAlertController(message: Strings.Alert.Message.passwordsAreNotIdentical)
                present(alert, animated: false)
                return
            }
            guard password.isValidPassword else {
                let alert = UIAlertController(title: Strings.Alert.Title.invalidPassword,
                                              message: Strings.Alert.Message.invalidPassword)
                present(alert, animated: false)
                return
            }
            MockData.shared.users.append(User(name: name, email: email, address: address,
                                              phoneNumber: phoneNumber, password: password))
            let okAction = UIAlertAction(title: Strings.Common.ok, style: .default) { _ in
                self.navigationController?.popViewController(animated: false)
            }
            let alert = UIAlertController(title: Strings.Alert.Title.userRequestSent,
                                          message: Strings.Alert.Message.userRequestSent,
                                          actions: [okAction])
            present(alert, animated: false)
        } else {
            var user = MockData.shared.currentUser
            user?.name = name
            user?.email = email
            user?.address = address
            user?.phoneNumber = phoneNumber
            MockData.shared.currentUser = user
            Toast(text: Strings.Toast.personalInfoUpdated).show()
            navigationController?.popViewController(animated: false)
        }
    }
}
