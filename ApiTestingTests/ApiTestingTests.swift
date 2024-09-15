//
//  ApiTestingTests.swift
//  ApiTestingTests
//
//  Created by Raghu on 04/08/24.
//

import XCTest
@testable import ApiTesting

final class ApiTestingTests: XCTestCase {
    //arrange
    var testViewModel: ViewModel!
    var mockNetworkManager: MockHttpClient!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        testViewModel = ViewModel(apiCallRef: APIClient())

        
        
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testViewModel = nil
        mockNetworkManager = nil
        
    }
    
    func testUserData_Success(){
        let expectedUser = [User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz")]
            let expectation = XCTestExpectation(description: "User data should be fetched and set")
            DispatchQueue.global(qos: .userInteractive).async {
                self.testViewModel.getUsers()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                XCTAssertEqual(self.testViewModel.users.first?.name, expectedUser.first?.name, "Fetched user name should match expected user")
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 5.0) // Wait for the expectation to be fulfilled or timeout
        
    }
    
    func testUserData_falilure(){
        let expectedUser = [User(id: 0, name: "", username: "", email: "")]
        let expectation = XCTestExpectation(description: "User data should be fetched and set")
        DispatchQueue.global(qos: .userInteractive).async {
            self.testViewModel.getUsers()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
           
            XCTAssertFalse(self.testViewModel.users.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
