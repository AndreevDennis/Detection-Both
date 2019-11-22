//
//  File.swift
//  Detection Both
//
//  Created by Денис Андреев on 21.11.2019.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import ARKit

final class GameViewController  : UIViewController {
    
    let arView:ARSCNView =  {
        let view = ARSCNView()
        view.translatesAutoresizingMaskIntoConstraints = false 
        return view
    }()
    
    let configuration = ARWorldTrackingConfiguration()
    
    @IBOutlet weak var minusButton: UIButton! = {
        var imagePlus = UIImage(named: "plus")
        var button = UIButton(type: .system)
        button.setImage(imagePlus?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor(white: 1.0, alpha: 0.7)
        button.layer.cornerRadius = 40.0
        button.layer.masksToBounds = true
        button.layer.zPosition = 1
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    @IBOutlet weak var myButtonPlus: UIButton! = {
        var imagePlus = UIImage(named: "plus")
        var button = UIButton(type: .system)
        button.setImage(imagePlus?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor(white: 1.0, alpha: 0.7)
        button.layer.cornerRadius = 40.0
        button.layer.masksToBounds = true
        button.layer.zPosition = 1
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    fileprivate func constraintsFunc() {
        view.addSubview(arView)
        arView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        arView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        arView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        arView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        constraintsFunc()
        arView.session.run(configuration, options: [])
        arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
        arView.autoenablesDefaultLighting = true
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        addBox()
    }
    
    @IBAction func minusButtonAction(_ sender: Any) {
        minusBox()
    }
    
    private func minusBox(){
        arView.scene.rootNode.enumerateChildNodes { (node, _ ) in
            node.removeFromParentNode()
        }
    }
    
    private func addBox(){
        let boxNode = SCNNode()
        boxNode.geometry = SCNBox(width: 0.05, height: 0.05, length: 0.05, chamferRadius: 0.0002)
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        boxNode.position = SCNVector3(Float.random(-0.5, max: 0.5), Float.random(-0.5, max: 0.5), Float.random(-0.5, max: 0.5))
        arView.scene.rootNode.addChildNode(boxNode)
    }
    
}
