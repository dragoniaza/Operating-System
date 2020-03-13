//
//  CameraMainRouterTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 5/2/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication

class CameraMainRouterTest:XCTestCase {
    
    var sut:CameraListRouter?
//    var navigationController = UINavigationController()
    var topViewController: UIViewController?
    
    override func setUp() {
        sut = CameraListRouter()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitialization() {
        let vc = sut?.createListModule()
        
            XCTAssertNotNil(vc)
            XCTAssertNotNil((vc)?.presenter)
            XCTAssertNotNil((vc)?.presenter?.interactor)
            XCTAssertTrue(vc is CameraListView)
            XCTAssertTrue(vc is PresenterToViewCameraListProtocol)
        }
    
    func testPushToNextModule(){
        sut?.pushToDetailModule(camera: cameraMocking, navigationController: (sut?.createListModule().navigationController)!)
    }
}
