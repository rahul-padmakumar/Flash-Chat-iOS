//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Rahul Padmakumar on 22/03/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var meAvatarImage: UIImageView!
    @IBOutlet weak var youAvatarImage: UIImageView!
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius =
        messageBubble.frame.height/5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
