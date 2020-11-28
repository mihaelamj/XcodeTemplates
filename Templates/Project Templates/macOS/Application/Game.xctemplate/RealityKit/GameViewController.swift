//___FILEHEADER___

import AppKit
import RealityKit

class ___FILEBASENAME___: NSViewController {
    
    @IBOutlet var arView: ARView!
    
    override func awakeFromNib() {
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
