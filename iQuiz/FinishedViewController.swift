//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Brian Luu on 2/24/19.
//  Copyright © 2019 Brian Luu. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    var totalRight : Int = 0
    var totalQuestion: Int = 1
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var endMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(totalQuestion < 1) {
            lblScore.text = "Invalid Score"
            endMsg.text = ""
        } else {
            var score: Double = (Double(totalRight) / Double(totalQuestion))
            score = round(score * 10) / 10;
            var msg = ""
            if(score < 0.6) {
                msg = "You failed"
            } else if(score > 0.6 && score < 1) {
                msg = "Almost!"
            } else if(score == 1) {
                msg = "Perfect!"
            }
            lblScore.text = "\(totalRight)/\(totalQuestion)"
            endMsg.text = msg
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
