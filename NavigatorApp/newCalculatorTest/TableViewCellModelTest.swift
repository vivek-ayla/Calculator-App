//
//  tableViewCellModel.swift
//  newCalculator
//
//  Created by Vivek K on 16/07/24.
//


import Testing
import UIKit
@testable import newCalculator

// MARK: TABLE VIEW CELL MODEL TEST CASES
@Suite("Model - Table View Cell Model")
struct tableViewCellModel {
    
    @Suite("Table View Cell Model Without Initializer")
    struct tableViewCellModelWithoutInitializer {
        var tvmut: TableViewCellModel = TableViewCellModel()
        
        @Test
        func getTitle() async throws {
            #expect(tvmut.getTitle() == "")
        }
        
        @Test
        func getSubTitle() async throws {
            #expect(tvmut.getSubTitle() == "")
        }
        
        @Test
        func getImage() async throws {
            #expect(tvmut.getImage() == UIImage(systemName: "info.circle"))
        }
    }
    
    @Suite("Table View Cell Model With Initializer")
    struct tableViewCellModelWithInitializer {
        var tvmut: TableViewCellModel = TableViewCellModel(title: "Table View Cell Title", subTitle: "Table View Cell Subtitle", image: UIImage(named: "calculator"))
        
        @Test
        func getTitle() async throws {
            #expect(tvmut.getTitle() == "Table View Cell Title")
        }
        
        @Test
        func getSubTitle() async throws {
            #expect(tvmut.getSubTitle() == "Table View Cell Subtitle")
        }
        
        @Test
        func getImage() async throws {
            #expect(tvmut.getImage() == UIImage(named: "calculator"))
        }
    }
}


