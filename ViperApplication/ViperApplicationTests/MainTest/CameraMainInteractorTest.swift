//
//  CameraMainInteractorTest.swift
//  ViperApplicationTests
//
//  Created by iosdev on 27/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import XCTest
@testable import ViperApplication

class CameraMainInterActorTest:XCTestCase{
    var sut:CameraListInteractor!
    var mockInteractorOutput:MockCameraMainOutputInteractorProtocol?
    var mockCameraDataManager = MockCameraDataManager()
    override func setUp() {
        sut = CameraListInteractor()
        mockInteractorOutput = MockCameraMainOutputInteractorProtocol()
        sut?.presenter = mockInteractorOutput
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockInteractorOutput = nil
        super.tearDown()
    }
    
    func testInitailCameraDataFromDataManager(){
        loadCameraList()
        guard let camera = sut.camera else {
            return
        }
        XCTAssertEqual(camera, StubCameraListResult.camera)
        XCTAssertTrue(mockInteractorOutput?.isSuccess ?? false)
    }
    
    func testInteractorPushOutputToPresenter(){
        sut?.initialCameraData()
        XCTAssertNotNil(sut?.cameraDataManager.addCamera)
        print(CameraDataManager.cameras.count)
    }
    
    private func loadCameraList(){
      mockCameraDataManager.camera = StubCameraListResult.camera
      sut.getAllCameraList()
      sut.camera = mockCameraDataManager.camera
    }
    
}

class MockCameraMainOutputInteractorProtocol: InteractorToPresenterCameraListProtocol{
    var isSuccess = false
    func getCameraListSuccess(cameraList: [CameraItem]) {
        isSuccess = true
    }
}


class MockCameraDataManager:CameraDataManager{
    var camera: [CameraItem]!
    override func getAllCameraList() -> [CameraItem] {
        return camera
    }
}

struct StubCameraListResult {
    static let camera = [CameraItem(name:"abc", price:"1,000"),
                           CameraItem(name:"zzz", price:"2,000"),
                           CameraItem(name:"xyz", price:"3,000"),
                            CameraItem(name: "asd", price: "4,000")]
}



