//
//  newCalculatorTests.swift
//  newCalculatorTests
//
//  Created by admin on 28/06/24.
//

import XCTest
@testable import newCalculator

final class newCalculatorTests: XCTestCase {
    
    var sut:CalculatorViewController = CalculatorViewController()

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSetExpression() throws{
        let expression = sut.setExpression("1234+5+9X13-6")
        
        XCTAssertEqual(expression,"1234+5+9X13-6","This unit should set the expression with the given string")
    }
    
    func testButtonOne(){
        let expression = sut.buttonOne()
        
        XCTAssertEqual(expression, "1","This unit should concatenate '1' to the expression")
        
    }
    
    func testButtonTwo(){
        let expression = sut.buttonTwo()
        
        XCTAssertEqual(expression, "2","This unit should concatenate '2' to the expression")
    }
    
    func testButtonThree(){
        let expression = sut.buttonThree()
        
        XCTAssertEqual(expression, "3","This unit should concatenate '3' to the expression")
    }
    
    func testButtonFour(){
        let expression = sut.buttonFour()
        
        XCTAssertEqual(expression, "4","This unit should concatenate '4' to the expression")
    }
    
    func testButtonFive(){
        let expression = sut.buttonFive()
        
        XCTAssertEqual(expression, "5","This unit should concatenate '5' to the expression")
    }
    
    func testButtonSix(){
        let expression = sut.buttonSix()
        
        XCTAssertEqual(expression, "6","This unit should concatenate '6' to the expression")
    }
    
    func testButtonSeven(){
        let expression = sut.buttonSeven()
        
        XCTAssertEqual(expression, "7","This unit should concatenate '7' to the expression")
    }
    
    func testButtonEight(){
        let expression = sut.buttonEight()
        
        XCTAssertEqual(expression, "8","This unit should concatenate '8' to the expression")
    }

    func testButtonNine(){
        let expression = sut.buttonNine()
        
        XCTAssertEqual(expression, "9","This unit should concatenate '9' to the expression")
    }
    
    func testButtonZero_AppendZero(){
        let expression = sut.buttonZero()
        
        XCTAssertEqual(expression, "0","This unit should concatenate '0' to the expression")
    }
    
    func testButtonZero_IfZeroAlreadyInExpression(){
        sut.expression = "1÷0"
        sut.expression = sut.buttonZero()
        
        XCTAssertEqual(sut.expression, "1÷0","This unit should concatenate '0' to the expression")
    }
    
    func testButtonDot(){
        let expression = sut.buttonDot()
        
        XCTAssertEqual(expression, ".","This unit should concatenate '.' to the expression")
    }
    
//    func testButtonEqual(){
//        sut.result = "1+3+9*10"
//        
//        sut.buttonEqual()
//        XCTAssertEqual(sut.expression,"94","This Gives the calculated result." )
//    }
    
    func testButtonAddition(){
        sut.expression = "12"
        sut.expression = sut.buttonAddition()
        
        XCTAssertEqual(sut.expression, "12+","This unit should concatenate '+' to the expression")
    }
    
    func testButtonSubtraction(){
        sut.expression = "387"
        sut.expression = sut.buttonSubtraction()
        
        XCTAssertEqual(sut.expression,"387-","This unit should concatenate '-' to the expression")
    }
    
    func testButtonMultiplication(){
        sut.expression = "185"
        sut.expression = sut.buttonMultiplication()
        
        XCTAssertEqual(sut.expression, "185X","This unit should concatenate 'X' to the expressioin")
    }

    func testButtonDivision(){
        sut.expression = "78"
        sut.expression = sut.buttonDivision()
        
        XCTAssertEqual(sut.expression, "78÷","This unit should concatenate '÷' to the expressioin")
    }
    
    func testButtonAllClear(){
        XCTAssertTrue(sut.buttonAllClear(),"It resets all the fields")
    }

    func testCalculateExpresssion() throws {
        let expression = "1+6+8-13"
        
        let result = sut.calculateExpression(expression)
        
        XCTAssertEqual(result, 2, "This unit should give the correct Calculated Result")
    }
}
