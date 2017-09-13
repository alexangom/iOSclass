//
//  Math.swift
//  HMW_1_IOS
//
//  Created by Alexan Gomez on 9/9/17.
//  Copyright © 2017 Alexan Gomez. All rights reserved.
//

import Foundation

class Math {
    var inputOne: Double
    var inputTwo: Double
    var isClean: Bool
    var isSecondInput: Bool
    var operationType: String
    var isNewInput: Bool
    var isAfterResult: Bool
    var isSecondInserted: Bool
    
    init(valueOne: Double, valueTwo: Double, cleanValues: Bool, enterSecond: Bool, math: String, newInput: Bool, resultAfter: Bool, secondInserted: Bool) {
        inputOne = valueOne
        inputTwo = valueTwo
        isClean = cleanValues
        isSecondInput = enterSecond
        operationType = math
        isNewInput = newInput
        isAfterResult = resultAfter
        isSecondInserted = secondInserted
    }
    
    func cleanValues() {
        inputOne = 0
        inputTwo = 0
        isSecondInput = false
        isNewInput = true
        isAfterResult = false
    }
    
    func executeMath() -> Double {
        switch operationType {
        case "multiply":
            let result:Double = self.inputOne * self.inputTwo
            return result
        case "divide":
            let result:Double = self.inputOne/self.inputTwo
            return result
        case "subtract":
            let result:Double = self.inputOne - self.inputTwo
            return result
        case "add":
            let result:Double = self.inputOne + self.inputTwo
            return result
        case "remainder":
            let result:Double = self.inputOne.truncatingRemainder(dividingBy: self.inputTwo)
            return result
        default:
            return 123
        }
    }
}
