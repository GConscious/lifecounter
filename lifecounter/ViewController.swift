//
//  ViewController.swift
//  lifecounter
//
//  Created by Amrith Gandham on 4/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    var players: [UILabel] = []
    var scores : [Int] = []
    var history: [String] = []
    
    //Labels
    
    @IBOutlet weak var playersStackView: UIStackView!
    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var countInput: UITextField!
    @IBOutlet weak var historyStackView: UIStackView!

    //Game status label
    @IBOutlet weak var gameOverStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...4 {
            addPlayer("Player \(i)")
        }
    }
    
    func addPlayer(_ name: String) {
        if players.count >= 8 {
            return
        }
        
        let playerCount = players.count + 1
        let playerLabel = UILabel()
        playerLabel.text = "Player \(playerCount): 20" // Include the initial score
        playerLabel.textAlignment = .center
        playerLabel.font = UIFont.systemFont(ofSize: 18)
        playersStackView.addArrangedSubview(playerLabel)
        players.append(playerLabel)
        
        scores.append(20)

        // Add button
        let addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.tag = playerCount - 1
        addButton.addTarget(self, action: #selector(addLife), for: .touchUpInside)
        playersStackView.addArrangedSubview(addButton)
        
        // Subtract button
        let subtractButton = UIButton(type: .system)
        subtractButton.setTitle("-", for: .normal)
        subtractButton.tag = playerCount - 1
        subtractButton.addTarget(self, action: #selector(decreaseLife), for: .touchUpInside)
        playersStackView.addArrangedSubview(subtractButton)
        
        // Update the game status label
        gameOverStatus.text = ""
    }
    
    //Implement the increase and decrease life functions
    @objc func addLife(sender: UIButton) {
        let playerIndex = sender.tag
        if let count = Int(countInput.text ?? ""), count > 0 {
            scores[playerIndex] += count
            players[playerIndex].text = "Player \(playerIndex + 1): \(scores[playerIndex])"
            checkScore()
        }
    }
    
    @objc func decreaseLife(sender: UIButton) {
        let playerIndex = sender.tag
        if let count = Int(countInput.text ?? ""), count > 0 {
            scores[playerIndex] -= count
            players[playerIndex].text = "Player \(playerIndex + 1): \(scores[playerIndex])"
            checkScore()
        }
    }
    
    @IBAction func addPlayer(_ sender: UIButton) {
        let playerCount = players.count + 1
        let name = "Player \(playerCount)"
        addPlayer(name)
        if players.count == 8{
            addPlayerButton.isEnabled = false
        }
    }
    
    @IBAction func showHistory(_ sender: UIButton) {
        performSegue(withIdentifier: "historySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "historySegue",
           let destinationVC = segue.destination as? HistoryViewController {
            destinationVC.history = history
        }
    }
    
    
    //Implement checkScore function
    func checkScore() {
        for (index, score) in scores.enumerated() {
            if score <= 0 {
                //Add to the history array
                history.append("Player \(index + 1) has lost.")
                gameOverStatus.text = "Player \(index + 1) loses"
                gameOverStatus.isHidden = false
                players[index].isHidden = true
                break
            }
        }
    }
    
}

