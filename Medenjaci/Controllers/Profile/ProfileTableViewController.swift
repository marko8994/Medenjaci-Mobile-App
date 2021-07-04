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

enum UpdatePersonalInfoRow: Int {
    case changePersonalInfo
    case changePassword
    case logout
}

class ProfileTableViewController: UITableViewController {
    
    typealias Segues = StoryboardSegue.Main
    
    var sections: [ProfileSection] = [.personalInfo, .updatePersonalInfo, .customerSupport]
    
    var currentUser = MockData.shared.currentUser

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.Title.profile
        tableView.keyboardDismissMode = .interactive
        tableView.contentInset.bottom = 50
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
        case .updatePersonalInfo:
            return 3
        case .customerSupport:
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        switch section {
        case .personalInfo:
            return UITableView.automaticDimension
        case .updatePersonalInfo, .customerSupport:
            return 54
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .personalInfo:
            guard let cell = personalInfoCell(for: indexPath) else { break }
            return cell
        case .updatePersonalInfo:
            guard let cell = updatePersonalInfoCell(for: indexPath) else { break }
            return cell
        case .customerSupport:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "supportTextFieldCell", for: indexPath)
                    as? TextFieldTableCell else { break }
                cell.placeholder = Strings.Placeholder.customerRequest
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)
                    as? SingleButtonCell else { break }
                cell.buttonTitle = Strings.Title.sendRequest
                return cell
            }
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
            headerView.contentView.backgroundColor = Assets.Colors.backgroundColor.color
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
    
    private func updatePersonalInfoCell(for indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)
            as? SingleButtonCell else { return nil }
        let row = UpdatePersonalInfoRow(rawValue: indexPath.row)
        switch row {
        case .changePersonalInfo:
            cell.buttonTitle = Strings.Title.changePersonalInfo
            cell.buttonAction = {
                self.perform(segue: Segues.changePersonalInfo)
            }
        case .changePassword:
            cell.buttonTitle = Strings.Title.changePassword
            cell.buttonAction = {
                self.perform(segue: Segues.changePassword)
            }
        case .logout:
            cell.buttonTitle = Strings.Title.logut
            cell.buttonAction = {
                let cancelAction = UIAlertAction(title: Strings.Common.cancel, style: .cancel)
                let confirmAction = UIAlertAction(title: Strings.Common.ok, style: .destructive) { _ in
                    let viewController = StoryboardScene.Registration.initialScene.instantiate()
                    let window = UIApplication.shared.windows.first!
                    window.windowLevel = UIWindow.Level.normal
                    window.rootViewController?.dismiss(animated: false, completion: nil)
                    window.rootViewController?.removeFromParent()
                    window.rootViewController = viewController
                }
                let alert = UIAlertController(title: Strings.Alert.Title.logoutConfirmation,
                                              message: nil,
                                              actions: [cancelAction, confirmAction])
                self.present(alert, animated: false)
            }
        case .none:
            return nil
        }
        return cell
    }
}
