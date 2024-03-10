//
//  ViewController.swift
//  CalculateHomeWork
//
//  Created by Hakan Hardal on 10.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorScreen: UILabel!
    
    @IBOutlet weak var calculatorResult: UILabel!
    

    var screen: String = ""
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        resetAll()
    }
    
    func deleteTap(){
        
        
    }
    
    func addToWorkings(value: String){
        screen = screen + value
        calculatorScreen.text = screen
    }
    
    
    func resetAll(){
        screen = ""
        calculatorScreen.text = ""
        calculatorResult.text = ""
    }

    
    @IBAction func resetTap(_ sender: Any) {
        resetAll()
    }
    
    @IBAction func deleteTap(_ sender: Any) {
        if (!screen.isEmpty){
            screen.removeLast()
            calculatorScreen.text = screen
        }
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        if(validInput()){
            screen = screen.replacingOccurrences(of: "/", with: "*1.0/")
            let checkedWorkingsForPercent =  screen.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResult.text = resultString
            
           
            
           
            
        }else{
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in screen{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        var previous: Int = -1
        
        for index in funcCharIndexes{
            if(index == 0){
                return false
            }
            if(index == screen.count - 1){
                return false
            }
            if (previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter(char: Character) -> Bool{
        if (char == "*"){
            return true
        }
        if (char == "/"){
            return true
        }
        if (char == "+"){
            return true
        }
        return false
        
        
    }
    
    func formatResult(result: Double) ->String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    @IBAction func decimalTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    
    //MARK: Numbers
    @IBAction func onetap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    
    
    //MARK: -Plus,multiply,divide,percent,minus
    
    @IBAction func plus(_ sender: Any) {
        
            addToWorkings(value: "+")
    }
    
    
    @IBAction func divide(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func minus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func multiply(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func percent(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
}

