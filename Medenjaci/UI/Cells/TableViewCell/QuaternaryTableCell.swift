//
//  OrderItemTableViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import UIKit

class QuaternaryTableCell: StyledTableViewCell {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var tertiaryLabel: UILabel!
    @IBOutlet weak var quaternaryLabel: UILabel!

    public func configure(with orderItem: OrderItem) {
        primaryLabel.text = orderItem.productName
        secondaryLabel.text = Strings.Common.quantity(orderItem.quantity)
        tertiaryLabel.text = Strings.Common.unitPrice(orderItem.unitPrice)
        quaternaryLabel.text = Strings.Common.dolarPrice(orderItem.price)
    }
    
    public func configure(with oldOrder: Order) {
        primaryLabel.text = Strings.Common.inlineOrderDate(oldOrder.date?.shortDate() ?? "")
        secondaryLabel.text = Strings.Common.totalAmount(oldOrder.totalAmount)
        tertiaryLabel.text = Strings.Common.inlineStatus(oldOrder.status?.name ?? "")
    }

}











