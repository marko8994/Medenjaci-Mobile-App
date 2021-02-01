//
//  ProfileTableViewController.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit

enum ProfileSection: Int {
    case personalInfo = 0
    case updatePersonalInfo
    case customerSupport
}

enum PersonalInfoRow: Int {
    case name
    case email
    case address
    case phoneNumber
}

class ProfileTableViewController: UITableViewController {
    
    typealias Segues = StoryboardSegue.Main
    
    var sections: [ProfileSection] = [.personalInfo, .updatePersonalInfo, .customerSupport]
    
    var currentUser = MockData.shared.currentUser

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Title.profile
        tableView.keyboardDismissMode = .interactive
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if Segues(segue) == Segues.changePersonalInfo,
           let changePersonalInfoVC = segue.destination as? SetUpUserInfoViewController {
            changePersonalInfoVC.isRegisterScreen = false
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .personalInfo:
            return 4
        case .updatePersonalInfo, .customerSupport:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .personalInfo:
            guard let cell = personalInfoCell(for: indexPath) else { break }
            return cell
        case .updatePersonalInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "personalInfoButtonsCell", for: indexPath)
                as? DoubleButtonCell else { break }
            cell.configureForPersonalInfo()
            return cell
        case .customerSupport:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "customerSupportCell", for: indexPath)
                as? TextViewAndButtonTableViewCell else { break }
            cell.configureForPersonalInfo()
            return cell
        }
        fatalError("Couldn't find cell for index path: \(String(describing: indexPath))")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sections[section] {
        case .personalInfo:
            return Strings.Section.personalInfo
        case .updatePersonalInfo:
            return nil
        case .customerSupport:
            return Strings.Section.customerSupport
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
    
    private func personalInfoCell(for indexPath: IndexPath) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalInfoCell", for: indexPath)
        let personalInfoRow = PersonalInfoRow(rawValue: indexPath.row)
        switch personalInfoRow {
        case .name:
            cell.textLabel?.text = currentUser.name
            cell.detailTextLabel?.text = Strings.Common.name
        case .email:
            cell.textLabel?.text = currentUser.email
            cell.detailTextLabel?.text = Strings.Common.email
        case .address:
            cell.textLabel?.text = currentUser.address
            cell.detailTextLabel?.text = Strings.Common.address
        case .phoneNumber:
            cell.textLabel?.text = currentUser.phoneNumber
            cell.detailTextLabel?.text = Strings.Common.phoneNumber
        case .none:
            return nil
        }
        return cell
    }

}
