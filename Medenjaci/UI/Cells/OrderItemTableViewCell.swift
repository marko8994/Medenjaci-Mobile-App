//
//  OrderItemTableViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import UIKit

class OrderItemTableViewCell: StyledTableViewCell {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var tertiaryLabel: UILabel!
    @IBOutlet weak var quaternaryLabel: UILabel!

    public func configure(with orderItem: OrderItem) {
        primaryLabel.text = orderItem.productName
        secondaryLabel.text = Strings.Common.quantity(orderItem.quantity)
        tertiaryLabel.text = Strings.Common.unitPrice(orderItem.unitPrice)
        quaternaryLabel.text = orderItem.price
    }
    
    public func configure(with oldOrder: Order) {
        primaryLabel.text = oldOrder.date?.shortDate()
        secondaryLabel.text = Strings.Common.amount(oldOrder.totalAmount)
        tertiaryLabel.text = Strings.Common.status(oldOrder.status?.name ?? "")
    }

}

private extension Date {
    
    func shortDate() -> String {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.dateFormat = "d MMM y"
        return formater.string(from: self)
    }
    
}











