//
//  ViewController.swift
//  HMW_1_IOS
//
//  Created by Alexan Gomez on 9/8/17.
//  Copyright © 2017 Alexan Gomez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Referencing buttons
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var eraseButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var remainderButton: UIButton!
    
    //Initiators
    var result: Double = 0
    
    //This object reference to class in file Math.swift
    var calculator = Math(valueOne: 0, valueTwo: 0, cleanValues: false, enterSecond: false, math: "undefined", newInput: true, resultAfter: false, secondInserted: false)
    
    // If a first input is done this function setup the variables to start capturing the second input from user
    func getReadyForSecondInput() {
        calculator.isSecondInput = true
        calculator.isNewInput = true
        calculator.isAfterResult = false
    }
    
    // Styling purposes
    func removeBorders(){
        multiplyButton.layer.borderWidth = 0
        divideButton.layer.borderWidth = 0
        minusButton.layer.borderWidth = 0
        plusButton.layer.borderWidth = 0
        remainderButton.layer.borderWidth = 0
    }
    
    // If equal bottom is not pressed this allows calculculate when operators buttoms are pressed
    func calculate() {
        result = calculator.executeMath()
        displayLabel.text = String(result)
        calculator.inputOne = result
        calculator.isNewInput = true
    }
    
    //All number inputs get into this function
    @IBAction func numbers(_ sender: UIButton) {
        // Adjust when a calculation is already done
        if(calculator.isAfterResult == true){
            calculator.isSecondInput = false
            calculator.isAfterResult = false
        }
        //If is a new input either for user input one or input second this erase the value of label display and capture new value
        if(calculator.isNewInput == true){
            displayLabel.text = ""
            calculator.isNewInput = false
        }
        displayLabel.text = displayLabel.text! + String(sender.tag - 1)
        //Check if the user is inserting the first input or the second one
        if(calculator.isSecondInput == false){
            calculator.inputOne = Double(displayLabel.text!)!
        }else{
            calculator.inputTwo = Double(displayLabel.text!)!
            calculator.isSecondInserted = true
        }
    }
    
    // Adds the decimal dot to display
    @IBAction func decimal(_ sender: UIButton) {
        displayLabel.text = displayLabel.text! + String(".")
    }
    
    // Clean screen and set up everything to begining
    @IBAction func clean(_ sender: Any) {
        calculator.cleanValues()
        displayLabel.text = "0"
        removeBorders()
    }
    
    //Cahnge value of current input
    @IBAction func changeSign(_ sender: Any) {
        if(calculator.isAfterResult == true){
            calculator.isAfterResult = false
            calculator.isSecondInput = false
        }
        if(calculator.isSecondInput == false){
            calculator.inputOne = calculator.inputOne * -1
            displayLabel.text = String(calculator.inputOne)
        }else{
            calculator.inputTwo = calculator.inputTwo * -1
            displayLabel.text = String(calculator.inputTwo)
        }
    }
    
    //Self explanaotry
    @IBAction func divide(_ sender: Any) {
        removeBorders()
        //Styling
        divideButton.layer.borderWidth = 1.5
        divideButton.layer.borderColor = UIColor.black.cgColor
        if(calculator.isSecondInserted == true){
            calculate()
        }
        getReadyForSecondInput()
        calculator.operationType = "divide"
    }
    

    @IBAction func multiply(_ sender: Any) {
        removeBorders()
        multiplyButton.layer.borderWidth = 1.5
        multiplyButton.layer.borderColor = UIColor.black.cgColor
        if(calculator.isSecondInserted == true){
            calculate()
        }
        getReadyForSecondInput()
        calculator.operationType = "multiply"
    }
    
    
    @IBAction func subtract(_ sender: Any) {
        removeBorders()
        minusButton.layer.borderWidth = 1.5
        minusButton.layer.borderColor = UIColor.black.cgColor
        if(calculator.isSecondInserted == true){
            calculate()
        }
        getReadyForSecondInput()
        calculator.operationType = "subtract"
    }
    
    @IBAction func add(_ sender: Any) {
        removeBorders()
        plusButton.layer.borderWidth = 1.5
        plusButton.layer.borderColor = UIColor.black.cgColor
        if(calculator.isSecondInserted == true){
            calculate()
        }
        getReadyForSecondInput()
        calculator.operationType = "add"
    }
    
    
    @IBAction func remainder(_ sender: Any) {
        removeBorders()
        remainderButton.layer.borderWidth = 1.5
        remainderButton.layer.borderColor = UIColor.black.cgColor
        if(calculator.isSecondInserted == true){
            calculate()
        }
        getReadyForSecondInput()
        calculator.operationType = "remainder"
    }
    
    
    @IBAction func equal(_ sender: Any) {
        result = calculator.executeMath()
        displayLabel.text = String(result)
        calculator.inputOne = result
        calculator.isNewInput = true
        calculator.isAfterResult = true
        calculator.isSecondInserted = false
        removeBorders()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayLabel.text = String("0")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

