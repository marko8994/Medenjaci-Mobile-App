//
//  TableTextViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit

class TableTextViewCell: StyledTableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.contentInset = UIEdgeInsets.zero
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.lineBreakMode = .byTruncatingTail
    }
    
    public var textContent: String? {
        didSet {
            textView.text = textContent
            textView.sizeToFit()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.sizeToFit()
    }
}
