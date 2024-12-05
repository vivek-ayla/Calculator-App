//
//  CollectionViewCellModelTest.swift
//  CollectionViewCellModelTest
//
//  Created by Vivek K on 16/07/24.
//

import Testing
import UIKit
@testable import newCalculator



@Suite("Model - Collection View Cell Model")
struct collectionViewCellModel {
    @Suite("Collection View Cell Model Without initializer")
    struct collectionViewCellModelWithoutInitializer {
        var cvmut: CollectionViewCellModel = CollectionViewCellModel()
        
        @Test
        func getTitle() async throws {
            #expect(cvmut.getTitle() == "")
        }
    }
    
    @Suite("Collection View Cell Model With initializer")
    struct collectionViewCellModelWithInitializer {
        var cvmut: CollectionViewCellModel = CollectionViewCellModel(title: "Collection View Cell Title")
        
        @Test
        func getTitle() async throws {
            #expect(cvmut.getTitle() == "Collection View Cell Title")
        }
    }
}

