//
//  ViewController.swift
//  DiceRoller
//
//  Created by Admin on 21.07.2018.
//  Copyright © 2018 Daniel Kaminski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView3: UIImageView!
    @IBOutlet weak var diceImageView4: UIImageView!
    @IBOutlet weak var diceImageView5: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let handChecker = HandChecker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollButton.layer.cornerRadius = 10
    }

    @IBAction func roll(_ sender: Any) {
        let numberRolled1 = Int(arc4random_uniform(6)+1)
        diceImageView1.image = UIImage(named: String(numberRolled1))
        let numberRolled2 = Int(arc4random_uniform(6)+1)
        diceImageView2.image = UIImage(named: String(numberRolled2))
        let numberRolled3 = Int(arc4random_uniform(6)+1)
        diceImageView3.image = UIImage(named: String(numberRolled3))
        let numberRolled4 = Int(arc4random_uniform(6)+1)
        diceImageView4.image = UIImage(named: String(numberRolled4))
        let numberRolled5 = Int(arc4random_uniform(6)+1)
        diceImageView5.image = UIImage(named: String(numberRolled5))
        resultLabel.text = handChecker.checkHand([numberRolled1, numberRolled2, numberRolled3, numberRolled4, numberRolled5]).rawValue
        handChecker.playSound()
    }
}




