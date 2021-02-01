//
//  ResetPasswordViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Title.resetPassword
        emailLabel.text = Strings.Common.email
        emailTextField.placeholder = Strings.Placeholder.email
        resetPasswordButton.setTitle(Strings.Title.resetPassword.uppercased(), for: .normal)
        setUpGestureRecognizer()
    }
    
    // MARK: Keyboard resign gesture recognizer
    private func setUpGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func tapOnView() {
        if emailTextField != nil, emailTextField.isFirstResponder {
            emailTextField.resignFirstResponder()
        }
    }

}
