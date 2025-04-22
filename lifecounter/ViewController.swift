//
//  ViewController.swift
//  lifecounter
//
//  Created by Amrith Gandham on 4/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    //Labels
    @IBOutlet weak var lifeCountLabelP1: UILabel!
    @IBOutlet weak var lifeCountLabelP2: UILabel!
    
    // Increment buttons
    @IBOutlet weak var lifeCountaddBtnP1: UIButton!
    @IBOutlet weak var lifeCountaddBtnP2: UIButton!
    
    //Decrement buttons
    @IBOutlet weak var lifeCountMinusBtnP1: UIButton!
    @IBOutlet weak var lifeCountMinusBtnP2: UIButton!

    //+5 buttons
    @IBOutlet weak var lifeCountadd5BtnP1: UIButton!
    @IBOutlet weak var lifeCountadd5BtnP2: UIButton!
    
    //-5 buttons
    @IBOutlet weak var lifeCountMinus5BtnP1: UIButton!
    @IBOutlet weak var lifeCountMinus5BtnP2: UIButton!
    
    //Game status label
    @IBOutlet weak var gameOverStatus: UILabel!

    var p1Count = 20
    var p2Count = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addOneP1(_ sender: Any) {
        p1Count += 1
        lifeCountLabelP1.text = "Player 1: \(p1Count)"
        checkScore()
    }
    
    @IBAction func addOneP2(_ sender: Any) {
        p2Count += 1
        lifeCountLabelP2.text = "Player 2: \(p2Count)"
        checkScore()
    }
    
    @IBAction func minusOneP1(_ sender: Any) {
        p1Count -= 1
        lifeCountLabelP1.text = "Player 1: \(p1Count)"
        checkScore()
    }
    
    @IBAction func minusOneP2(_ sender: Any) {
        p2Count -= 1
        lifeCountLabelP2.text = "Player 2: \(p2Count)"
        checkScore()
    }
    
    @IBAction func add5P1(_ sender: Any) {
        p1Count += 5
        lifeCountLabelP1.text = "Player 1: \(p1Count)"
        checkScore()
    }
    
    @IBAction func add5P2(_ sender: Any) {
        p2Count += 5
        lifeCountLabelP2.text = "Player 2: \(p2Count)"
        checkScore()
    }
    
    @IBAction func minus5P1(_ sender: Any) {
        p1Count -= 5
        lifeCountLabelP1.text = "Player 1: \(p1Count)"
        checkScore()
    }
    
    @IBAction func minus5P2(_ sender: Any) {
        p2Count -= 5
        lifeCountLabelP2.text = "Player 2: \(p2Count)"
        checkScore()
    }
    
    func checkScore() {
        if p1Count <= 0 {
            gameOverStatus.text = "Player 1 LOSES"
        } else if p2Count <= 0 {
            gameOverStatus.text = "Player 2 LOSES"
        }
    }
    
}

