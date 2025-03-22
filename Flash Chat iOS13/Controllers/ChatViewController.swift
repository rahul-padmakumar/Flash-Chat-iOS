//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let messages = [
        Messages(sender: "2@test.com", message: "Hi"),
        Messages(sender: "1@test.com", message: "Heyy"),
        Messages(sender: "2@test.com", message: "Whats up!")
    ]
    
    @IBAction func onLogoutPressed(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
            let allViewControllers : [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
            self.navigationController!.popToViewController(allViewControllers[0], animated: true)
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
}

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].message
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
}
