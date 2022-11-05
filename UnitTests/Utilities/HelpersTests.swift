//
//  HelpersTests.swift
//  UnitTests
//
//  Created by Marcelo de Araujo on 23.04.2022.

import XCTest
@testable import Country

class HelpersTests: XCTestCase {

    func test_localized_knownLocale() {
        let sut = "Country".localized(Locale(identifier: "fr"))
        XCTAssertEqual(sut, "Des pays")
    }
    
    func test_localized_unknownLocale() {
        let sut = "Country".localized(Locale(identifier: "ch"))
        XCTAssertEqual(sut, "Country")
    }
    
    func test_result_isSuccess() {
        let sut1 = Result<Void, Error>.success(())
        let sut2 = Result<Void, Error>.failure(NSError.test)
        XCTAssertTrue(sut1.isSuccess)
        XCTAssertFalse(sut2.isSuccess)
    }
}
