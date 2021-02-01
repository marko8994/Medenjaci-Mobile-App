//
//  HomeTableViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var model: HomeModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Medenjaci"
        model = MockData.shared.loadData("Home")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.categories.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "collectionContainerCell", for: indexPath)
                as? CollectionContainerTableViewCell else {
            fatalError("Couldn't not dequeue cell for \(indexPath)")
        }
        let products = model.categories[indexPath.section].products
        cell.configure(items: products)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.categories[section].name
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
