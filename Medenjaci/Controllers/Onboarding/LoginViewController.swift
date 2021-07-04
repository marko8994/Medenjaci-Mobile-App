//
//  LoginViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit
import Toaster

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
        title = Strings.Title.login
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
        loginButton.setTitle(Strings.Title.login.uppercased(), for: .normal)
        forgotPasswordButton.setTitle(Strings.Common.forgotPassword, for: .normal)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
//        guard let email = emailTextField.text, !email.isEmpty,
//              let password = passwordTextField.text, !password.isEmpty else {
//            let alert = UIAlertController(message: Strings.Alert.Message.cantLoginWithoutEmailAndPassword)
//            present(alert, animated: false)
//            return
//        }
//        guard email.isValidEmail else {
//            let alert = UIAlertController(message: Strings.Alert.Message.invalidEmail)
//            present(alert, animated: false)
//            return
//        }
//        guard let user = MockData.shared.users.first(where: {$0.email == email}) else {
//            let alert = UIAlertController(title: Strings.Alert.Title.sorry,
//                                          message: Strings.Alert.Message.userDoesntExist)
//            present(alert, animated: false)
//            return
//        }
//        guard password == user.password else {
//            let alert = UIAlertController(title: Strings.Alert.Title.sorry,
//                                          message: Strings.Alert.Message.cantMatchUserAndPassword)
//            present(alert, animated: false)
//            return
//        }
        let viewController = StoryboardScene.Main.initialScene.instantiate()
        let window = UIApplication.shared.windows.first!
        window.windowLevel = UIWindow.Level.normal
        window.rootViewController?.dismiss(animated: false, completion: nil)
        window.rootViewController?.removeFromParent()
        window.rootViewController = viewController
        MockData.shared.currentUser = MockData.shared.users.first

//        MockData.shared.currentUser = user
    }
}
