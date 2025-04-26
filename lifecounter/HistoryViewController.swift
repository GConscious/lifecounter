//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Amrith Gandham on 4/25/25.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    var history: [String] = []
    
    @IBOutlet weak var historyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "HistoryCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        cell.textLabel?.text = history[indexPath.row]
        return cell
    }
}
