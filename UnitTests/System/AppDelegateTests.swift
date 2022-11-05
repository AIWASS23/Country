//
//  AppDelegateTests.swift
//  UnitTests
//
//  Created by Marcelo de Araujo on 12.04.2022.

import XCTest
import UIKit
@testable import Country

final class AppDelegateTests: XCTestCase {

    func test_didFinishLaunching() {
        let sut = AppDelegate()
        let eventsHandler = MockedSystemEventsHandler(expected: [])
        sut.systemEventsHandler = eventsHandler as! any SystemEventsHandler
        _ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])
        eventsHandler.verify()
    }
    
    func test_pushRegistration() {
        let sut = AppDelegate()
        let eventsHandler = MockedSystemEventsHandler(expected: [
            .pushRegistration, .pushRegistration
        ])
        sut.systemEventsHandler = eventsHandler as! any SystemEventsHandler
        sut.application(UIApplication.shared, didRegisterForRemoteNotificationsWithDeviceToken: Data())
        sut.application(UIApplication.shared, didFailToRegisterForRemoteNotificationsWithError: NSError.test)
        eventsHandler.verify()
    }
    
    func test_didRecevieRemoteNotification() {
        let sut = AppDelegate()
        let eventsHandler = MockedSystemEventsHandler(expected: [
            .recevieRemoteNotification
        ])
        sut.systemEventsHandler = eventsHandler as! any SystemEventsHandler
        sut.application(UIApplication.shared, didReceiveRemoteNotification: [:], fetchCompletionHandler: { _ in })
        eventsHandler.verify()
    }
    
    func test_systemEventsHandler() {
        let sut = AppDelegate()
        let handler = sut.systemEventsHandler
        XCTAssertTrue(handler is RealSystemEventsHandler)
    }
}
