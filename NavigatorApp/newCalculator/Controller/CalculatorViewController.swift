//
//  ViewController.swift
//  newCalculator
//
//  Created by admin on 25/06/24.
//

import UIKit

protocol CalculatorViewDelegate{
    func sendResult(result: Double)
}


class CalculatorViewController: UIViewController{
    
    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var delegate: CalculatorViewDelegate?
    var resultValue: Double = 0
    var result = " "
    var expression = " "
        
    @IBAction func buttonOneTap(_ sender: Any) {
        expressionLabel.text = buttonOne()
    }
    
    @IBAction func buttonTwoTap(_ sender: Any) {
        expressionLabel.text = buttonTwo()
    }
    
    @IBAction func buttonThreeTap(_ sender: Any) {
        expressionLabel.text = buttonThree()
    }
    
    @IBAction func buttonFourTap(_ sender: Any) {
        expressionLabel.text = buttonFour()
    }
    
    @IBAction func buttonFiveTap(_ sender: Any) {
        expressionLabel.text = buttonFive()
    }
    
    @IBAction func buttonSixTap(_ sender: Any) {
        expressionLabel.text = buttonSix()
    }
    
    
    @IBAction func buttonSevenTap(_ sender: Any) {
        expressionLabel.text = buttonSeven()
    }
    
    
    @IBAction func buttonEightTap(_ sender: Any) {
        expressionLabel.text = buttonEight()
    }
    
    
    @IBAction func buttonNineTap(_ sender: Any) {
        expressionLabel.text = buttonNine()
    }
    
    @IBAction func buttonZeroTap(_ sender: Any) {
        expressionLabel.text = buttonZero()
    }
    
    @IBAction func buttonDotTap(_ sender: Any) {
        expressionLabel.text = buttonDot()
    }
    
    @IBAction func buttonEqualTap(_ sender: Any) {
        buttonEqual()
    }
    
    @IBAction func buttonAdditionTap(_ sender: Any) {
        expressionLabel.text = buttonAddition()
    }
    
    @IBAction func buttonSubtractionTap(_ sender: Any) {
        expressionLabel.text = buttonSubtraction()
    }
    
    @IBAction func buttonMultiplicationTap(_ sender: Any) {
        expressionLabel.text = buttonMultiplication()
    }
    
    @IBAction func buttonDivisionTap(_ sender: Any) {
        expressionLabel.text = buttonDivision()
    }
    
    @IBAction func buttonAllClearTap(_ sender: Any) {
        if(buttonAllClear()){
            expressionLabel.text = " "
            resultLabel.text = " "
            resultValue = 0
        }
    }
    
    // MARK: RESULT BUTTON
    @IBAction func resultButtonTap(_ sender: Any) {
        
        let resultValue: Double = resultValue
        performSegue(withIdentifier: "segueToResultVC", sender: resultValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "segueToResultVC") {
           let rv = segue.destination as! ResultViewController
           rv.resultValue = resultLabel.text
       }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CalculatorViewController{
    
    func resultButtonTapped() {
        
        delegate?.sendResult(result: resultValue)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ResultViewController")
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }

    func setExpression(_ buttonValue:String)->String{
        expression += buttonValue
        result = expression
        return expression.trimmingCharacters(in: .whitespaces)
    }
    
    func buttonOne()->String{
        return setExpression("1")
    }
    
    func buttonTwo()-> String{
        return setExpression("2")
    }
    
    func buttonThree()->String{
        return setExpression("3")
    }
    
    func buttonFour()->String{
        return setExpression("4")
    }
    
    func buttonFive()->String{
        return setExpression("5")
    }
    
    func buttonSix()->String{
        return setExpression("6")
    }
    
    func buttonSeven()->String{
        return setExpression("7")
    }
    
    func buttonEight()->String{
        return setExpression("8")
    }
    
    func buttonNine()->String{
        return setExpression("9")
    }
    
    func buttonZero()->String{
        if expression.trimmingCharacters(in: .whitespaces).isEmpty {
                expression = "0"
            } else if expression.suffix(2) == "+0" || expression.suffix(2) == "-0" || expression.suffix(2) == "X0" || expression.suffix(2) == "÷0" {
                expression.removeLast()
                expression += "0"
            } else {
                expression += "0"
            }
            result = expression
            return expression
    }
    
    func buttonDot()->String{
        let lastSegment = expression.split { ["+", "-", "X", "÷"].contains(String($0)) }.last ?? ""
        
        if !lastSegment.contains(".") {
            return setExpression(".")
        }
        return setExpression(".")
    }
    
    func buttonEqual(){
        if expression.trimmingCharacters(in: .whitespaces).isEmpty {
                return
        }
        expression = " "
        expressionLabel.text = expression
            
        if let temporaryResult = calculateExpression(result) {
            let calculatedStr: String
            if temporaryResult.truncatingRemainder(dividingBy: 1) == 0 {
                calculatedStr = String(format: "%.0f", temporaryResult)
            } else {
                calculatedStr = String(temporaryResult)
            }
                
            resultLabel.text = calculatedStr

            if resultLabel.text != " " {
                expression = calculatedStr
            }
        }else {
                resultLabel.text = "Error"
        }
    }
    
    func buttonAddition()->String{
        if(expression.suffix(1) == "+" || expression.suffix(1) == "-" || expression.suffix(1) == "X" ||
           expression.suffix(1) == "÷"){
            expression.removeLast()
        }
        if expression != " "{
            expression += "+"
        }
        result = expression
        return expression
    }
    
    func buttonSubtraction()->String{
        if(expression.suffix(1) == "+" || expression.suffix(1) == "-" || expression.suffix(1) == "X" ||
           expression.suffix(1) == "÷"){
            expression.removeLast()
        }
        return setExpression("-")
    }
    
    func buttonMultiplication()->String{
        if(expression.suffix(1) == "+" || expression.suffix(1) == "-" || expression.suffix(1) == "X" ||
           expression.suffix(1) == "÷"){
            expression.removeLast()
        }
        
        if expression != " "{
            expression += "X"
        }
        
        result = expression
        return expression
    }
    
    
    func buttonDivision()->String{
        if(expression.suffix(1) == "+" || expression.suffix(1) == "-" || expression.suffix(1) == "X" ||
           expression.suffix(1) == "÷"){
            expression.removeLast()
        }
        if expression != " "{
            expression += "÷"
        }
        result = expression
        return expression
    }
    
    func buttonAllClear()->Bool{
        result = " "
        expression = " "
                
        if result == " " || expression == " "{
            return true;
        }
        return false;
    }
    
    func calculateExpression(_ expression: String) -> Double? {
        let modifiedExpression = expression.replacingOccurrences(of: "X", with: "*").replacingOccurrences(of: "÷", with: "/")

        let exp = NSExpression(format: modifiedExpression)
        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            resultValue = result
            return result
        }
        return nil
    }
}
