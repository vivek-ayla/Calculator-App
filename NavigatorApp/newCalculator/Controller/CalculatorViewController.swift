//
//  ViewController.swift
//  newCalculator
//
//  Created by admin on 25/06/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = " "
    var expression = " "
    
    @IBAction func buttonOneTap(_ sender: Any) {
        buttonOne()
    }
    
    @IBAction func buttonTwoTap(_ sender: Any) {
        buttonTwo()
    }
    
    @IBAction func buttonThreeTap(_ sender: Any) {
        buttonThree()
    }
    
    @IBAction func buttonFourTap(_ sender: Any) {
        buttonFour()
    }
    
    @IBAction func buttonFiveTap(_ sender: Any) {
        buttonFive()
    }
    
    @IBAction func buttonSixTap(_ sender: Any) {
        buttonSix()
    }
    
    
    @IBAction func buttonSevenTap(_ sender: Any) {
        buttonSeven()
    }
    
    
    @IBAction func buttonEightTap(_ sender: Any) {
        buttonEight()
    }
    
    
    @IBAction func buttonNineTap(_ sender: Any) {
        buttonNine()
    }
    
    @IBAction func buttonZeroTap(_ sender: Any) {
        buttonZero()
    }
    
    @IBAction func buttonDotTap(_ sender: Any) {
        buttonDot()
    }
    
    @IBAction func buttonEqualTap(_ sender: Any) {
        buttonEqual()
    }
    
    @IBAction func buttonAdditionTap(_ sender: Any) {
        buttonAddition()
    }
    
    
    @IBAction func buttonSubtractionTap(_ sender: Any) {
        buttonSubtraction()
    }
    
    
    @IBAction func buttonMultiplicationTap(_ sender: Any) {
        buttonMultiplication()
    }
    
    @IBAction func buttonDivisionTap(_ sender: Any) {
        buttonDivision()
    }
    
    @IBAction func buttonAllClearTap(_ sender: Any) {
        buttonAllClear()
    }
    
    @IBAction func resultButtonTap(_ sender: Any) {
        resultButtonTapped()
    }
    
// <<<<<<< Vivek/Features
// =======
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToResultVC") {
            let rv = segue.destination as! ResultViewController
            rv.resultValue = sender as? String
        }
    }
// >>>>>>> Develop
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTitle(_ :)), name: Notification.Name(rawValue: notificationKey), object: nil)
        // Do any additional setup after loading the view.
    }
}

extension CalculatorViewController{
    
    @objc func updateTitle(_ notifications: NSNotification){
        navigationItem.title = notifications.userInfo?["data"] as? String
    }
    
    func resultButtonTapped(){
        let rvc = storyboard?.instantiateViewController(withIdentifier: "resultVC") as! ResultViewController
        rvc.delegate = self
        navigationController?.pushViewController(rvc, animated: true)
    }
    
    func setExpression(_ buttonValue:String){
        expression += buttonValue
        result = expression
        expressionLabel.text = expression
    }
    
    func buttonOne(){
        setExpression("1")
    }
    
    func buttonTwo(){
        setExpression("2")
    }
    
    func buttonThree(){
        setExpression("3")
    }
    
    func buttonFour(){
        setExpression("4")
    }
    
    func buttonFive(){
        setExpression("5")
    }
    
    func buttonSix(){
        setExpression("6")
    }
    
    func buttonSeven(){
        setExpression("7")
    }
    
    func buttonEight(){
        setExpression("8")
    }
    
    func buttonNine(){
        setExpression("9")
    }
    
    func buttonZero(){
        if expression.trimmingCharacters(in: .whitespaces).isEmpty {
                expression = "0"
            } else if expression.suffix(2) == "+0" || expression.suffix(2) == "-0" || expression.suffix(2) == "X0" || expression.suffix(2) == "÷0" {
                expression.removeLast()
                expression += "0"
            } else {
                expression += "0"
            }
            result = expression
            expressionLabel.text = expression
    }
    
    func buttonDot(){
        let lastSegment = expression.split { ["+", "-", "X", "÷"].contains(String($0)) }.last ?? ""
        
        if !lastSegment.contains(".") {
            setExpression(".")
        }
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
    
    func buttonAddition(){
        if(expression.suffix(1) == "+" || expression.suffix(1) == "-" || expression.suffix(1) == "X" ||
           expression.suffix(1) == "÷"){
            expression.removeLast()
        }
        if expression != " "{
            expression += "+"
        }
        result = expression
        expressionLabel.text = expression
    }
    
    func buttonSubtraction(){
        if(expression.suffix(1) == "+" || expression.suffix(1) == "-" || expression.suffix(1) == "X" ||
           expression.suffix(1) == "÷"){
            expression.removeLast()
        }
        
        setExpression("-")
    }
    
    func buttonMultiplication(){
        if(expression.suffix(1) == "+" || expression.suffix(1) == "-" || expression.suffix(1) == "X" ||
           expression.suffix(1) == "÷"){
            expression.removeLast()
        }
        
        if expression != " "{
            expression += "X"
        }
        
        result = expression
        expressionLabel.text = expression
    }
    
    
    func buttonDivision(){
        if(expression.suffix(1) == "+" || expression.suffix(1) == "-" || expression.suffix(1) == "X" ||
           expression.suffix(1) == "÷"){
            expression.removeLast()
        }
        if expression != " "{
            expression += "÷"
        }
        result = expression
        expressionLabel.text = expression
    }
    
    func buttonAllClear(){
        result = " "
        expression = " "
        expressionLabel.text = " "
        resultLabel.text = " "
    }
    
    func calculateExpression(_ expression: String) -> Double? {
        let modifiedExpression = expression.replacingOccurrences(of: "X", with: "*").replacingOccurrences(of: "÷", with: "/")

        let exp = NSExpression(format: modifiedExpression)
        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            return result
        }
        return nil
    }
}

extension CalculatorViewController: ResultDelegate{
    func sendDataToCVC(data: String) {
        navigationItem.title = data
    }
}
