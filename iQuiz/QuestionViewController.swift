//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Brian Luu on 2/24/19.
//  Copyright © 2019 Brian Luu. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!
    
    var jsonData: [Quiz]? = nil
    var categoryIndex: Int = -1
    var currentQuestion = 0;
    var lastSelectedAnswer: Int = -1
    var questionAnswered = 0;
    var questionRight = 0;
    
    @IBAction func answerOneSelected(_ sender: UIButton) {
        lastSelectedAnswer = 0
        sender.backgroundColor = UIColor.lightGray
        btnAnswer2.backgroundColor = UIColor.white
        btnAnswer3.backgroundColor = UIColor.white
        btnAnswer4.backgroundColor = UIColor.white
    }
    
    @IBAction func answerTwoSelected(_ sender: UIButton) {
        lastSelectedAnswer = 1
        sender.backgroundColor = UIColor.lightGray
        btnAnswer1.backgroundColor = UIColor.white
        btnAnswer3.backgroundColor = UIColor.white
        btnAnswer4.backgroundColor = UIColor.white
    }
    
    @IBAction func answerThreeSelected(_ sender: UIButton) {
        lastSelectedAnswer = 2
        sender.backgroundColor = UIColor.lightGray
        btnAnswer1.backgroundColor = UIColor.white
        btnAnswer2.backgroundColor = UIColor.white
        btnAnswer4.backgroundColor = UIColor.white
    }
    
    @IBAction func answerFourSelected(_ sender: UIButton) {
        lastSelectedAnswer = 3
        sender.backgroundColor = UIColor.lightGray
        btnAnswer1.backgroundColor = UIColor.white
        btnAnswer2.backgroundColor = UIColor.white
        btnAnswer3.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblQuestion.text = jsonData?[categoryIndex].questions[currentQuestion].text
        btnAnswer1.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[0], for: .normal)
        btnAnswer2.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[1], for: .normal)
        btnAnswer3.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[2], for: .normal)
        btnAnswer4.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[3], for: .normal)
    }

    
    @IBAction func submitPressed(_ sender: Any) {
        if(lastSelectedAnswer == -1) {
            let alert = UIAlertController(title: "No Selection", message: "Please select an answer to continue.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "toReveal", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toReveal") {
            let dest = segue.destination as! AnswerViewController
            dest.lastSelectedAnswer = lastSelectedAnswer
            dest.categoryIndex = categoryIndex
            dest.jsonData = jsonData
            dest.currentQuestion = currentQuestion
            dest.questionAnswered = questionAnswered
            dest.questionRight = questionRight
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
