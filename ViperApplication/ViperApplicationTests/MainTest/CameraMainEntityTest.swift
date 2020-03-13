//
//  CameraMainEntityTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 28/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication
class CameraMainEntityTest:XCTestCase{
    var sut:CameraDataManager?
    override func setUp() {
        sut = CameraDataManager()
        super.setUp()
        
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testnotnil(){
        sut?.addCamera(cameraMocking)
        let cameraData = sut?.addCamera(cameraMocking)
        XCTAssertNotNil(cameraData)
    }
    func testequal(){
        let cameraTest = CameraItem(name: "Camera123", price: "5,000")
        XCTAssertEqual(cameraTest.name, "Camera123")
        XCTAssertEqual(cameraTest.price, "5,000")
    }
    
    func testAddNewCamera(){
        let camAppend = [cameraMocking]
        XCTAssertNotNil(camAppend)
        XCTAssertEqual(camAppend.count,1)
    }
    
    func testRomveCamera(){
        var camRemove = [cameraMocking]
        camRemove.removeAll()
        XCTAssertEqual(camRemove.count,0)
    }
}

