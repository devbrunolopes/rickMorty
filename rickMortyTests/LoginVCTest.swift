//
//  rickMortyTests.swift
//  rickMortyTests
//
//  Created by Franklin  Stilhano on 5/2/23.
//
@testable import rickMorty
import XCTest

class LoginVCTest: XCTestCase {
    
    // MARK: - subject under test
    private var sut: HomeViewModel!
    
    // MARK: - test lifecycle
    override func setUp() {
        super.setUp()
        sut = HomeViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - test

    func testViewDidLoad(){
        let tableView = UITableView()
        let result: [Result] = []
        sut.dataSearchBar = result
        sut.userShouldInteractWithCollection(tableView: tableView)
        
        XCTAssertEqual(tableView.isUserInteractionEnabled, false)
    }
    
    func testViewDidLoad2(){
        let tableView = UITableView()
        let result: [Result] = [
            Result(id: nil, name: nil, status: nil, species: nil, type: nil, gender: nil, origin: nil, location: nil, image: nil, episode: nil, url: nil, created: nil)
        ]
        sut.dataSearchBar = result
        sut.userShouldInteractWithCollection(tableView: tableView)
        
        XCTAssertEqual(tableView.isUserInteractionEnabled, true)
    }
    
}
