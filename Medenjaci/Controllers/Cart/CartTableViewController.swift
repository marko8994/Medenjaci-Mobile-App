//
//  CartTableViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit
import Toaster

enum CartSection: Int {
    case orderItems = 0
    case orderSummary
    case previousOrders
}

enum OrderSummaryRow: Int {
    case orderAmount
    case order
}

class CartTableViewController: UITableViewController {
    
    typealias Segues = StoryboardSegue.Main
    
    var sections: [CartSection] {
        var sections = [CartSection]()
        if currentOrder != nil {
            sections.append(contentsOf: [.orderItems, .orderSummary])
        } else {
            sections.append(.orderItems)
        }
        sections.append(.previousOrders)
        return sections
    }
    
    var previousOrders: [Order]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var currentOrder: Order? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Common.cart
        tableView.keyboardDismissMode = .interactive
        tableView.contentInset.bottom = 50
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentOrder = MockData.shared.currentOrder
        previousOrders = MockData.shared.previousOrders.sorted {$0.date! > $1.date!}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if Segues(segue) == Segues.orderDetails, let orderUid = sender as? Int,
           let orderDetailsVC = segue.destination as? OrderDetailsViewController {
            orderDetailsVC.orderUid = orderUid
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .orderItems:
            if let currentOrder = currentOrder {
                return currentOrder.orderItems.count
            } else {
                return 1
            }
        case .orderSummary:
            return 2
        case .previousOrders:
            if let previousOrders = previousOrders {
                return previousOrders.count
            } else {
                return 1
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .orderItems:
            if let currentOrder = currentOrder, currentOrder.orderItems.count > 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemCell", for: indexPath)
                        as? QuaternaryTableCell else { break }
                cell.configure(with: currentOrder.orderItems[indexPath.row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "noItemsCell", for: indexPath)
                cell.textLabel?.text = Strings.EmptySection.emptyCurrentOrder
                return cell
            }
        case .orderSummary:
            guard let cell = orderSummaryCell(for: indexPath) else { break }
            return cell
        case .previousOrders:
            if let previousOrders = previousOrders {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "oldOrderCell", for: indexPath)
                        as? QuaternaryTableCell else { break }
                cell.configure(with: previousOrders[indexPath.row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "noItemsCell", for: indexPath)
                cell.textLabel?.text = Strings.EmptySection.noOlderOrders
                return cell
            }
        }
        fatalError("Couldn't find cell for index path: \(String(describing: indexPath))")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if sections[indexPath.section] == .previousOrders, let previousOrders = previousOrders {
            perform(segue: Segues.orderDetails, sender: previousOrders[indexPath.row].uid)
        } else {
            return
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sections[section] {
        case .orderItems:
            return Strings.Section.currentOrder
        case .orderSummary:
            return nil
        case .previousOrders:
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
            guard let totalAmount = currentOrder?.totalAmount else { return nil }
            cell.textLabel?.text = Strings.Common.totalAmount(totalAmount)
            return cell
        case .order:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
                as? TextFieldAndButtonTableCell else { return nil }
            cell.textFieldPlaceholder = Strings.Placeholder.orderNotes
            cell.buttonTitle = Strings.Title.order
            cell.buttonAction = {
                let cancelAction = UIAlertAction(title: Strings.Common.cancel, style: .cancel)
                let confirmAction = UIAlertAction(title: Strings.Alert.ButtonTitle.confirm, style: .default) { _ in
                    var orderNotes: String?
                    if let notes = cell.textField.text {
                        orderNotes = notes
                    }
                    var currentOrder = MockData.shared.currentOrder!
                    currentOrder.orderNotes = orderNotes
                    currentOrder.date = Date()
                    currentOrder.status = .pending
                    MockData.shared.previousOrders.append(currentOrder)
                    self.previousOrders = MockData.shared.previousOrders.sorted {$0.date! > $1.date!}
                    self.currentOrder = nil
                    MockData.shared.currentOrder = nil
                }
                let alert = UIAlertController(title: Strings.Alert.Title.confirmOrder,
                                              message: Strings.Alert.Message.confirmOrder,
                                              actions: [cancelAction, confirmAction])
                self.present(alert, animated: false)
            }
            return cell
        case .none:
            return nil
        }
    }

}
