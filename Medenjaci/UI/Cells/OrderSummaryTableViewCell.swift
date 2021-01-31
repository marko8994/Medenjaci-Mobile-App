//
//  OrderSummaryTableViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import UIKit

class OrderSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var orderNotesLabel: UILabel!
    @IBOutlet weak var orderNotesTextField: UITextField!
    @IBOutlet weak var orderButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        orderButton.setTitle(Strings.Common.order.uppercased(), for: .normal)
        orderNotesLabel.text = Strings.Common.orderNotes
        orderNotesTextField.placeholder = Strings.Placeholder.orderNotes
    }

}
