//
//  SceneDelegateTests.swift
//  UnitTests
//
//  Created by Marcelo de Araujo on 12.04.2022.

import XCTest
import UIKit
@testable import Country

final class SceneDelegateTests: XCTestCase {
    
    private lazy var scene: UIScene = {
        UIApplication.shared.connectedScenes.first!
    }()
    
    func test_openURLContexts() {
        let sut = SceneDelegate()
        let eventsHandler = MockedSystemEventsHandler(expected: [
            .openURL
        ])
        sut.systemEventsHandler = eventsHandler as! any SystemEventsHandler
        sut.scene(scene, openURLContexts: .init())
        eventsHandler.verify()
    }
    
    func test_didBecomeActive() {
        let sut = SceneDelegate()
        let eventsHandler = MockedSystemEventsHandler(expected: [
            .becomeActive
        ])
        sut.systemEventsHandler = eventsHandler as! any SystemEventsHandler
        sut.sceneDidBecomeActive(scene)
        eventsHandler.verify()
    }
    
    func test_willResignActive() {
        let sut = SceneDelegate()
        let eventsHandler = MockedSystemEventsHandler(expected: [
            .resignActive
        ])
        sut.systemEventsHandler = eventsHandler as! any SystemEventsHandler
        sut.sceneWillResignActive(scene)
        eventsHandler.verify()
    }
}
