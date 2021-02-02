//
//  ProductDetailsTableViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit

enum ProductDetailsSection: Int {
    case spotlight
    case description
    case usageDescription
    case price
    case addToCart
}

class ProductDetailsTableViewController: UITableViewController {
    
    var sections: [ProductDetailsSection] = [.spotlight, .description, .usageDescription, .price, .addToCart]
    
    var productUid: String! {
        didSet {
            product = MockData.shared.loadData("Product-\(productUid ?? "1")")
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
        if sections[section] == .addToCart {
            return 2
        } else {
            return 1
        }
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
            cell.textLabel?.text = product.price
            return cell
        case .addToCart:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemAmountCell", for: indexPath)
                    as? TextFieldTableCell else { break }
                cell.infoText = Strings.Common.itemAmount
                cell.placeholder = Strings.Placeholder.itemAmount
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderButtonCell", for: indexPath)
                    as? SingleButtonCell else { break }
                cell.buttonTitle = Strings.Title.addToCart
                return cell
            }
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
        case .addToCart:
            return Strings.Title.addToCart
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = Assets.Colors.backgroundColor.color
            headerView.textLabel?.textColor = Assets.Colors.primaryTextColor.color
            headerView.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }

}
