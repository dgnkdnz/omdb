//
//  LoodosTests.swift
//  LoodosTests
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import XCTest
@testable import Loodos

class LoodosTests: XCTestCase {

	func testSearchMovie() {
		let omdbService = OMDBService.shared
		XCTAssertNotNil(omdbService)
		let title = "batman"
		let expectation = XCTestExpectation(description: "OMDBService completed async task and call success completion")
		OMDBService.shared.execute(requestRoute: .search(title: title, page: 1), responseModel: MovieSearchResponseModel.self) { response in
			switch response {
			case .success(let movies):
				XCTAssertNotNil(movies)
				expectation.fulfill()
				break
			case .failure(let error):
				XCTAssert(true, error.localizedDescription)
				expectation.fulfill()
				break
			}
		}
		wait(for: [expectation], timeout: 5)
	}
}
