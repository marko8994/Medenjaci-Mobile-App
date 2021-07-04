//
//  ProductDetailsTableViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit
import Toaster

enum ProductDetailsSection: Int {
    case spotlight
    case description
    case usageDescription
    case price
    case order
}

class ProductDetailsTableViewController: UITableViewController {
    
    var sections: [ProductDetailsSection] = [.spotlight, .description, .usageDescription, .price, .order]
    
    var productUid: Int! {
        didSet {
            product = MockData.shared.loadData("Product-\(String(productUid))")
        }
    }
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = product.name
        tableView.contentInset.bottom = 50
        tableView.keyboardDismissMode = .interactive
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        switch section {
        case .spotlight:
            return 250
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .spotlight:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "spotlightCell", for: indexPath)
                    as? TableSpotlightCell else { break }
            cell.configure(with: product.imageName)
            return cell
        case .description, .usageDescription:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productDetailsCell", for: indexPath)
                    as? BasicTableCell else { break }
            if section == .description {
                cell.textContent = product.description
            } else {
                cell.textContent = product.usageDirections
            }
            return cell
        case .price:
            let cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath)
            cell.textLabel?.text = String(product.price) + "$"
            return cell
        case .order:
            guard let cell = orderCell(for: indexPath) else { break }
            return cell
        }
        fatalError("Couldn't find cell for index path: \(String(describing: indexPath))")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sections[section] {
        case .spotlight:
            return nil
        case .description:
            return Strings.Section.description
        case .usageDescription:
            return Strings.Section.usageDirections
        case .price:
            return Strings.Common.price
        case .order:
            return Strings.Title.order
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = Assets.Colors.backgroundColor.color
            headerView.textLabel?.textColor = Assets.Colors.primaryTextColor.color
            headerView.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    private func orderCell(for indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
            as? TextFieldAndButtonTableCell else { return nil }
        cell.buttonTitle = Strings.Title.addToCart
        cell.textFieldPlaceholder = Strings.Placeholder.itemAmount
        cell.buttonAction = {
            guard let itemAmount = cell.textField.text, let quantity = Int(itemAmount) else { return }
            guard quantity < 10 else {
                let alert = UIAlertController(title: Strings.Alert.Title.sorry,
                                              message: Strings.Alert.Message.maximumQuantityOfItemInOrder)
                self.present(alert, animated: false)
                return
            }
            let orderItem = OrderItem(productName: self.product.name, quantity: quantity,
                                      price: self.product.price * quantity, unitPrice: self.product.price)
            if var currentOrder = MockData.shared.currentOrder {
                currentOrder.orderItems.append(orderItem)
                currentOrder.totalAmount += orderItem.price
                MockData.shared.currentOrder = currentOrder
            } else {
                MockData.shared.currentOrder = Order(uid: MockData.shared.previousOrders.count + 1,
                                                     orderItems: [orderItem], totalAmount: orderItem.price,
                                                     date: nil, status: nil, orderNotes: nil,
                                                     rejectionReason: nil, arrivalEstimate: nil)
            }
            Toast(text: Strings.Toast.itemAddedToCart(self.product.name)).show()
            self.navigationController?.popViewController(animated: false)
        }
        return cell
    }
}

// MARK: UITextField delegate
extension ProductDetailsTableViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn: "123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
