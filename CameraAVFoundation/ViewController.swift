//
//  ViewController.swift
//  CameraAVFoundation
//
//  Created by Paweł Sternik on 06.03.2016.
//  Copyright © 2016 PawelSternik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: View Controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// MARK: Setup
    
    func viewDidLoadSetup() {
        let screenFrame = UIScreen.mainScreen().bounds
        let previewDimension = CGSize(width: CGRectGetWidth(screenFrame), height: CGRectGetHeight(screenFrame))
        
        CameraManager.generateCameraPreview(previewSize: previewDimension) { [unowned self] sessionPreview in
            guard let preview = sessionPreview else { return }
            self.view.addSubview(preview)
        }
    }

}

