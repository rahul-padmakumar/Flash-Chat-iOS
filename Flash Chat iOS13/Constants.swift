//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Rahul Padmakumar on 21/03/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import Foundation

struct Constants{
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let REGISTER_TO_CHAT_SEGUE = "registerToChatSegue"
    static let LOGIN_TO_CHAT_SEGUE = "loginToChatSegue"
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}


