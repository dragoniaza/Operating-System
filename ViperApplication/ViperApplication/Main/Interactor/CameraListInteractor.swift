//
//  ViperInteractor.swift
//  ViperApplication
//
//  Created by iosdev on 24/1/2563 BE.
//  Copyright © 2563 iosdev. All rights reserved.
//

import UIKit


class CameraListInteractor: PresenterToInteractorCameraListProtocol {
    var camera : [CameraItem]!
    var presenter: InteractorToPresenterCameraListProtocol?
    var cameraDataManager = CameraDataManager()
    
    func initialCameraData() {
        self.cameraDataManager.initialCameraData()
        self.getAllCameraList()
    }
    
    func getAllCameraList() {
        camera = self.cameraDataManager.getAllCameraList()
        presenter?.getCameraListSuccess(cameraList: camera)
    }
}
