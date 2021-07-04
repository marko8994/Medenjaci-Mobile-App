//
//  TextFieldAndButtonTableCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 4.7.21..
//

import UIKit

class TextFieldAndButtonTableCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var buttonAction: (() -> Void)?
    
    var buttonTitle: String? {
        didSet {
            button.setTitle(buttonTitle?.uppercased(), for: .normal)
        }
    }
    
    var textFieldPlaceholder: String? {
        didSet {
            textField.placeholder = textFieldPlaceholder
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }

    @objc private func buttonTap() {
        buttonAction?()
    }
}
