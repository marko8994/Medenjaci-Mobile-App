//
//  RegistrationAndLoginFlowViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit

class RegistrationFlowViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    

    weak var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Title.register
        setUpScrollView()
        setUpGestureRecognizer()
        registerForNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Interface setup
    private func setUpScrollView() {
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.keyboardDismissMode = .interactive
    }

    // MARK: Register for system notifications
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow),
            name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: Notification observers functions
    @objc func keyboardDidShow(notification: Notification) {
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        guard let activeTextField = activeTextField, let keyboardHeight = keyboardSize?.height else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight + 10, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        let activeRect = activeTextField.convert(activeTextField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(activeRect, animated: true)
    }

    @objc func keyboardWillBeHidden() {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: Keyboard resign gesture recognizer
    private func setUpGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func tapOnView() {
        if let activeTextField = activeTextField, activeTextField.isFirstResponder {
            activeTextField.resignFirstResponder()
        }
    }

}

// MARK: UITextField Delegate
extension RegistrationFlowViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
}
