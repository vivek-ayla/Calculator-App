//
//  newCalculatorTest.swift
//  newCalculatorTest
//
//  Created by admin on 09/07/24.
//

import Testing
@testable import newCalculator

struct newCalculatorTest{
    
    var sut:CalculatorViewController = CalculatorViewController()
    
    @Test func setExpression() throws{
        let expression = sut.setExpression("1234+5+9X13-6")
        let result = "1234+5+9X13-6"
        
        #expect(expression == result)
    }
    
    @Test func buttonOne(){
        let expression = sut.buttonOne()
        let result = "1"
        
        #expect(expression == result)
    }
    
    @Test func buttonTwo(){
        let expression = sut.buttonTwo()
        let result = "2"
        
        #expect(expression == result)
    }
    
    @Test func buttonThree(){
        let expression = sut.buttonThree()
        let result = "3"
        
        #expect(expression == result)
        
    }
    
    @Test func buttonFour(){
        let expression = sut.buttonFour()
        let result = "4"
        
        #expect(expression == result)
        
    }
    
    @Test func buttonFive(){
        let expression = sut.buttonFive()
        let result = "5"
        
        #expect(expression == result)
        
    }
    
    @Test func buttonSix(){
        let expression = sut.buttonSix()
        let result = "6"
        
        #expect(expression == result)
        
    }
    
    @Test func buttonSeven(){
        let expression = sut.buttonSeven()
        let result = "7"
        
        #expect(expression == result)
        
    }
    
    @Test func buttonEight(){
        let expression = sut.buttonEight()
        let result = "8"
        
        #expect(expression == result)
        
    }
    
    @Test func buttonNine(){
        let expression = sut.buttonNine()
        let result = "9"
        
        #expect(expression == result)
    }
    
    @Test func buttonZero_AppendZero(){
        let expression = sut.buttonZero()
        let result = "0"
        
        #expect(expression == result)
    }
    
    @Test func buttonZero_IfZeroAlreadyInExpression(){
        sut.expression = "1÷0"
        sut.expression = sut.buttonZero()
        
        let expression = sut.expression
        let result = "1÷0"
        
        #expect(expression == result)
    }
    
    @Test func buttonDot(){
        let expression = sut.buttonDot()
        let result = "."
        
        #expect(expression == result)
    }
    
    @Test func buttonAddition(){
        sut.expression = "12"
        sut.expression = sut.buttonAddition()
        
        let expression = sut.expression
        let result = "12+"
        
        #expect(expression == result)
    }
    
    @Test func buttonSubtraction(){
        sut.expression = "387"
        sut.expression = sut.buttonSubtraction()
        
        let expression = sut.expression
        let result = "387-"
        
        #expect(expression == result)
    }
    
    @Test func buttonMultiplication(){
        sut.expression = "185"
        sut.expression = sut.buttonMultiplication()
        
        let expression = sut.expression
        let result = "185X"
        
        #expect(expression == result)
    }
    
    @Test func buttonDivision(){
        sut.expression = "78"
        sut.expression = sut.buttonDivision()
        
        let expression = sut.expression
        let result = "78÷"
        
        #expect(expression == result)
    }
    
    @Test func buttonAllClear(){
        #expect(sut.buttonAllClear() == true)
    }
    
    @Test func calculateExpresssion() throws {
        let expression = "1+6+8-13"
        
        let result = sut.calculateExpression(expression)
        
        #expect(result == 2)
    }
    
}
