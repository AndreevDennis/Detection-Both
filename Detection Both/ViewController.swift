//
//  ViewController.swift
//  Detection Both
//
//  Created by Денис Андреев on 21.11.2019.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!

    
    override func viewDidLoad() {
        sceneView.delegate = self
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//        sceneView.scene = scene
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
}
