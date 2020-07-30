//
//  ViewController.swift
//  GroupedMessagesLBTA
//
//  Created by Brian Voong on 8/25/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate let cellId = "id123"
    
    var textMessages = [
        "Here's my very first message",
        "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap",
      "I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrapI'm going to message another long message that will word wrap."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.transform = CGAffineTransform(rotationAngle: (-.pi))
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right:  tableView.bounds.size.width - 10)

//tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        var indexPaths = [IndexPath]()
                         
               for i in textMessages.count...textMessages.count + 2 {
                    self.textMessages.insert("mercury", at: 0)
                   indexPaths.append(IndexPath(row: i, section: 0))
               }
              self.tableView.performBatchUpdates({
                  self.tableView.insertRows(at: indexPaths,
                                            with: .automatic)
                self.tableView.reloadData()
              }, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        cell.transform = CGAffineTransform(rotationAngle: (-.pi))
       // cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        cell.selectionStyle = .none

//        cell.textLabel?.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line."
//        cell.textLabel?.numberOfLines = 0
        cell.messageLabel.text = textMessages[indexPath.row]
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               self.scrollToTop()
           }
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        var text2 = [
               "Here's my very first message",
               "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap",
             "I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrap.I'm going to message another long message that will word wrapI'm going to message another long message that will word wrap."
           ]

        textMessages = text2 + textMessages
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: textMessages.count - 1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    @IBAction func trashButtonTapped(_ sender: UIBarButtonItem) {
        textMessages.removeAll()
        tableView.reloadData()
    }
    
    private func scrollToTop() {
        let topRow = IndexPath(row: 0,
                               section: 0)
        self.tableView.scrollToRow(at: topRow,
                                   at: .top,
                                   animated: true)
    }
}















