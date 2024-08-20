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
    var apiClient:APIClient!
    var VM:ViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
            apiClient = APIClient()
        VM = ViewModel()
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClient = nil
        VM = nil
        try super.tearDownWithError()
    }
    func testFetchUsers() {
        //ApiTesting
        // Create an expectation for the async operation
        let expectation = self.expectation(description: "Fetching users from API")

        // Call the API
        apiClient.fetchUsers { result in
            switch result {
            case .success(let users):
                // Check that the response is not empty
                print(users)
                XCTAssertFalse(users.isEmpty, "Expected non-empty user list")
                
                // Check that the first user's data is correct (example check)
                let firstUser = users.first
                
                XCTAssertEqual(firstUser?.name, "Leanne Graham", "Expected first user username to be 'Bret'")
            case .failure(let error):
                // Fail the test if the API request fails
                XCTFail("API call failed with error: \(error.localizedDescription)")
            }
            // Fulfill the expectation to indicate that the async operation has completed
            expectation.fulfill()
        }
        // Wait for expectations to be fulfilled
        waitForExpectations(timeout: 5, handler: nil)
        
       }
    //when we craete new testcase function fisrt latter is must and shoud write test before function name
    func testFetchUsers1(){
        
        VM.getUsers()
    }
}
