//
//  ChatMessageCell.swift
//  GroupedMessagesLBTA
//
//  Created by Brian Voong on 8/25/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        addSubview(messageLabel)

        messageLabel.text = ""
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // lets set up some constraints for our label
        let constraints = [messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        messageLabel.widthAnchor.constraint(equalToConstant: self.bounds.width - 100),
    
        ]
        
        NSLayoutConstraint.activate(constraints)
        
//        messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
