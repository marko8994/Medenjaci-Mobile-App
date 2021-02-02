//
//  ChangePasswordViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit

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

}
