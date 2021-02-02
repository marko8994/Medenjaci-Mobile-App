//
//  CartTableViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit

enum CartSection: Int {
    case orderItems = 0
    case orderSummary
    case oldOrders
}

enum OrderSummaryRow: Int {
    case orderAmount
    case orderNotes
    case orderButton
}

class CartTableViewController: UITableViewController {
    
    var sections: [CartSection] {
        var sections = [CartSection]()
        if currentOrder != nil {
            sections.append(contentsOf: [.orderItems, .orderSummary])
        } else {
            sections.append(.orderItems)
        }
        sections.append(.oldOrders)
        return sections
    }
    
    var oldOrders: [Order]? {
        let orders: [Order]? = MockData.shared.loadArrayData("Cart")
        if let previousOrders = orders {
            return previousOrders
        } else {
            return nil
        }
    }
    
    var currentOrder = MockData.shared.currentOrder

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Common.cart
        tableView.keyboardDismissMode = .interactive
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .orderItems:
            if let currentOrder = currentOrder, let orderItems = currentOrder.orderItems {
                return orderItems.count
            } else {
                return 1
            }
        case .orderSummary:
            return 3
        case .oldOrders:
            if let oldOrders = oldOrders {
                return oldOrders.count
            } else {
                return 1
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .orderItems:
            if let currentOrder = currentOrder, let orderItems = currentOrder.orderItems, orderItems.count > 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemCell", for: indexPath)
                        as? QuaternaryTableCell else { break }
                cell.configure(with: orderItems[indexPath.row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "noItemsCell", for: indexPath)
                cell.textLabel?.text = Strings.EmptySection.emptyCurrentOrder
                return cell
            }
        case .orderSummary:
            guard let cell = orderSummaryCell(for: indexPath) else { break }
            return cell
        case .oldOrders:
            if let oldOrders = oldOrders {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "oldOrderCell", for: indexPath)
                        as? QuaternaryTableCell else { break }
                cell.configure(with: oldOrders[indexPath.row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "noItemsCell", for: indexPath)
                cell.textLabel?.text = Strings.EmptySection.noOlderOrders
                return cell
            }
        }
        fatalError("Couldn't find cell for index path: \(String(describing: indexPath))")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sections[section] {
        case .orderItems:
            return Strings.Section.currentOrder
        case .orderSummary:
            return nil
        case .oldOrders:
            return Strings.Section.previousOrders
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = Assets.Colors.backgroundColor.color
            headerView.textLabel?.textColor = Assets.Colors.primaryTextColor.color
            headerView.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    private func orderSummaryCell(for indexPath: IndexPath) -> UITableViewCell? {
        let sectionRow = OrderSummaryRow(rawValue: indexPath.row)
        switch sectionRow {
        case .orderAmount:
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderAmountCell", for: indexPath)
            cell.textLabel?.text = Strings.Common.totalAmount(currentOrder?.totalAmount ?? "")
            return cell
        case .orderNotes:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderNotesCell", for: indexPath)
                as? TextFieldTableCell else { return nil }
            cell.infoText = Strings.Common.orderNotes
            cell.placeholder = Strings.Placeholder.orderNotes
            return cell
        case .orderButton:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderButtonCell", for: indexPath)
                as? SingleButtonCell else { return nil }
            cell.buttonTitle = Strings.Title.order
            return cell
        case .none:
            return nil
        }
    }

}
