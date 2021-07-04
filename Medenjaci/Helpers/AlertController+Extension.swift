//
//  AlertController+Extension.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 4.7.21..
//

import UIKit

extension UIAlertController {
    
    convenience init(title: String? = nil, message: String?, actions: [UIAlertAction]? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        if let actions = actions {
            actions.forEach { self.addAction($0) }
        } else {
            let cancel = UIAlertAction(title: Strings.Common.ok,
                                       style: .cancel,
                                       handler: nil)
            self.addAction(cancel)
        }
    }

}
