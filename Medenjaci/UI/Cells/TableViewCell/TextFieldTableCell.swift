//
//  OrderSummaryTableViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import UIKit

class TextFieldTableCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }
}
