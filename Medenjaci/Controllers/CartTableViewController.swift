//
//  CartTableViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit

enum CartSection: Int {
    case orderItems = 0
    case orderAmount
    case orderSummary
    case oldOrders
}

class CartTableViewController: UITableViewController {
    
    var sections: [CartSection] {
        var sections = [CartSection]()
        if currentOrder != nil {
            sections.append(contentsOf: [.orderItems, .orderAmount, .orderSummary])
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
        case .orderAmount, .orderSummary:
            return 1
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
                        as? OrderItemTableViewCell else { break }
                cell.configure(with: orderItems[indexPath.row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "noItemsCell", for: indexPath)
                cell.textLabel?.text = Strings.EmptySection.emptyCurrentOrder
                return cell
            }
        case .orderAmount:
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderAmountCell", for: indexPath)
            cell.textLabel?.text = Strings.Common.totalAmount(currentOrder?.totalAmount ?? "")
            return cell
        case .orderSummary:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSummaryCell", for: indexPath)
                as? TextViewAndButtonTableViewCell else { break }
            cell.configureForOrderSummary()
            return cell
        case .oldOrders:
            if let oldOrders = oldOrders {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "oldOrderCell", for: indexPath)
                        as? OrderItemTableViewCell else { break }
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
        case .orderAmount:
            return nil
        case .orderSummary:
            return Strings.Section.orderNotes
        case .oldOrders:
            return Strings.Section.previousOrders
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = Assets.Colors.sectionHeaderBackgroundColor.color
            headerView.layer.cornerRadius = headerView.frame.height / 2
            headerView.layer.masksToBounds = true
            headerView.textLabel?.textColor = Assets.Colors.primaryTextColor.color
            headerView.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }

}
