//
//  DataSource.swift
//  iQuiz
//
//  Created by Ray Zhang on 11/12/18.
//  Copyright © 2018 Ray Zhang. All rights reserved.
//

import Foundation


class DataSource {
    static let shared = DataSource()
    var allData: Quiz
    var currentCategory: Int
    
    init(){
        
    }
    
    func setQuiz(quiz: Quiz) {
        DataSource.allData = quiz
    }
    
    func setCategory (_ num: Int){
        DataSource.currentCategory = num
    }
}
