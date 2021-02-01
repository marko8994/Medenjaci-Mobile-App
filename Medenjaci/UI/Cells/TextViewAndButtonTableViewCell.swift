//
//  OrderSummaryTableViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import UIKit

class TextViewAndButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureForOrderSummary() {
        button.setTitle(Strings.Common.order.uppercased(), for: .normal)
        textField.placeholder = Strings.Placeholder.orderNotes
    }
    
    public func configureForPersonalInfo() {
        button.setTitle(Strings.Title.sendRequest.uppercased(), for: .normal)
        textField.placeholder = Strings.Placeholder.customerRequest
    }
}
