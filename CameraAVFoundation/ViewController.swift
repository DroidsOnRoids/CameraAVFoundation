//
//  ViewController.swift
//  CameraAVFoundation
//
//  Created by Paweł Sternik on 06.03.2016.
//  Copyright © 2016 PawelSternik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var switchCameraButton: UIButton!
    @IBOutlet weak var flashButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadSetup()
    }
    
    func viewDidLoadSetup() {
        let screenFrame = UIScreen.mainScreen().bounds
        let previewDimension = CGSize(width: CGRectGetWidth(screenFrame), height: CGRectGetHeight(screenFrame))
        
        CameraManager.generateCameraPreview(previewSize: previewDimension) { [unowned self] sessionPreview in
            guard let preview = sessionPreview, firstSubview = self.view.subviews.first else { return }
            self.view.insertSubview(preview, belowSubview: firstSubview)
        }
    }

}

