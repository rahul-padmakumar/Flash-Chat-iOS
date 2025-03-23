//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Messages] = []
    
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
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        loadMessages()
    }
    
    func loadMessages(){
        db.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField).addSnapshotListener { snapshot, error in
            self.messages = []
            if error != nil{
                print(error!)
            } else {
                if let safeSnapshotDoc = snapshot?.documents{
                    for doc in safeSnapshotDoc{
                        let data = doc.data()
                        if let sender = data[Constants.FStore.senderField] as? String,
                           let message = data[Constants.FStore.bodyField] as? String{
                            self.messages.append(
                                Messages(sender: sender, message: message)
                            )
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        messageTextfield.endEditing(true)
        
        if let message = messageTextfield.text, let sender = Auth.auth().currentUser?.email{
            db.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.bodyField: message,
                Constants.FStore.senderField: sender,
                Constants.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if error != nil{
                    print(error?.localizedDescription ?? "")
                } else {
                    self.messageTextfield.text = ""
                    print("Data send")
                }
            }
        }
    }
}

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].message
        return cell
    }
}
