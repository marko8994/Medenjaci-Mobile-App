//
//  ChangePasswordViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit
import Toaster

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var newPasswordLabel: UILabel!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var repeatNewPasswordLabel: UILabel!
    @IBOutlet weak var repeatNewPasswordTextField: UITextField!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Title.changePassword
        setUpLabels()
        setUpPlaceholders()
        changePasswordButton.setTitle(Strings.Title.changePassword.uppercased(), for: .normal)
    }
    
    // MARK: Interface setup
    private func setUpLabels() {
        newPasswordLabel.text = Strings.Common.newPassword
        repeatNewPasswordLabel.text = Strings.Common.repeatNewPassword
    }
    
    private func setUpPlaceholders() {
        newPasswordTextField.placeholder = Strings.Placeholder.newPassword
        repeatNewPasswordTextField.placeholder = Strings.Placeholder.repeatNewPassword
    }
    
    @IBAction func changePasswordButtonAction(_ sender: Any) {
        guard let password = newPasswordTextField.text, let repeatedPassword = repeatNewPasswordTextField.text,
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
        MockData.shared.currentUser?.password = password
        Toast(text: Strings.Toast.passwordChanged).show()
        navigationController?.popViewController(animated: false)
    }
    

}
