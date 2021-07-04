//
//  OrderDetailsViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 02/02/2021.
//

import UIKit

enum OrderDetailsSection: Int {
    case summary
    case amount
    case additionalInfo
}

enum AdditionalInfoRow: Int {
    case orderDate
    case status
    case orderNotes
    case rejectionReason
    case arrivalEstimate
}

class OrderDetailsViewController: UITableViewController {
    
    var sections: [OrderDetailsSection] = [.summary, .amount, .additionalInfo]
    
    var orderUid: Int? {
        didSet {
            order = MockData.shared.previousOrders.first(where: {$0.uid == orderUid})
        }
    }
    
    var order: Order?
    
    var additionalInfoRows: [AdditionalInfoRow] {
        var rows: [AdditionalInfoRow] = [.orderDate, .status]
        if order?.orderNotes != nil {
            rows.append(.orderNotes)
        }
        if order?.status == .rejected, order?.rejectionReason != nil {
            rows.append(.rejectionReason)
        }
        if order?.status == .approved {
            rows.append(.arrivalEstimate)
        }
        return rows
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Title.orderDetails
        tableView.contentInset.bottom = 50
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .summary:
            return order?.orderItems.count ?? 0
        case .amount:
            return 1
        case .additionalInfo:
            return additionalInfoRows.count
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .summary:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemCell", for: indexPath)
                    as? QuaternaryTableCell, let orderItems = order?.orderItems else { break }
            cell.configure(with: orderItems[indexPath.row])
            return cell
        case .amount:
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderAmountCell", for: indexPath)
            guard let totalAmount = order?.totalAmount else { break }
            cell.textLabel?.text = Strings.Common.totalAmount(totalAmount)
            return cell
        case .additionalInfo:
            guard let cell = additionalInfoCell(for: indexPath) else { break }
            return cell
        }
        fatalError("Couldn't find cell for index path: \(String(describing: indexPath))")
    }
    
    private func additionalInfoCell(for indexPath: IndexPath) -> UITableViewCell? {
        guard let order = order else { return nil }
        let row = additionalInfoRows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderInfoCell", for: indexPath)
        switch row {
        case .orderDate:
            cell.textLabel?.text = order.date?.shortDate()
            cell.detailTextLabel?.text = Strings.Common.orderDate
        case .status:
            cell.textLabel?.text = order.status?.name ?? ""
            cell.detailTextLabel?.text = Strings.Common.status
        case .orderNotes:
            cell.textLabel?.text = order.orderNotes
            cell.detailTextLabel?.text = Strings.Common.orderNotes
        case .rejectionReason:
            cell.textLabel?.text = order.rejectionReason
            cell.detailTextLabel?.text = Strings.Common.rejectionReason
        case .arrivalEstimate:
            guard let arrivalEstimate = order.arrivalEstimate else { return nil }
            cell.textLabel?.text = arrivalEstimate == 1 ? Strings.Common.inDay(arrivalEstimate) :
                Strings.Common.inDays(arrivalEstimate)
            cell.detailTextLabel?.text = Strings.Common.arrivalEstimate
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sections[section] {
        case .summary:
            return Strings.Section.orderSummary
        case .amount:
            return nil
        case .additionalInfo:
            return Strings.Section.additionalOrderInfo
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
