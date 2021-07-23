//
//  CatalogueElementsPresenterTests.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 22/07/21.
//

import XCTest
@testable import MVPCatalogueApp

class CatalogueElementsPresenterTests: XCTestCase {
    
    var catalogueElementsPresenter: CatalogueElementsPresenter!
    var mockServiceManager: MockServiceManager!
    var mockCatalogueElementsView: MockCatalogueElementsView!

    override func setUpWithError() throws {
        mockServiceManager = MockServiceManager()
        mockCatalogueElementsView = MockCatalogueElementsView()
        catalogueElementsPresenter = CatalogueElementsPresenter(serviceManager: mockServiceManager)
        catalogueElementsPresenter.setViewDelegate(catalogueElementsViewDelegate: mockCatalogueElementsView)
    }

    override func tearDownWithError() throws {
        mockCatalogueElementsView.elements = []
    }

    func testLoadCatalogueElements_withSuccessfulAPICall_shouldDisplayElements() throws {
        //Setup
        let expectedCatalogueItem = MockCatalogueItemModels.defaultCatalogueItemModels()
        mockServiceManager.mockItemsList = expectedCatalogueItem
        
        //Test
        catalogueElementsPresenter.loadCatalogueElements(with: "testName")
        
        //Verify
        XCTAssertEqual(mockCatalogueElementsView.elements, expectedCatalogueItem)
        XCTAssertTrue(!mockCatalogueElementsView.elements.isEmpty)
    }
}
