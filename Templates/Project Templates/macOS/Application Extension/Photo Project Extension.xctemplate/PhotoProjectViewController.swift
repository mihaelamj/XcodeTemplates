//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Cocoa
import PhotosUI

class PhotoProjectViewController: NSViewController, PHProjectExtensionController {
    
    var projectExtensionContext: PHProjectExtensionContext? {
        get {
            return extensionContext as? PHProjectExtensionContext
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // MARK: - PHProjectExtensionController
    
    func typeDescriptionDataSource(for category: PHProjectCategory, invalidator: PHProjectTypeDescriptionInvalidator) -> PHProjectTypeDescriptionDataSource {
        return ProjectTypeDescriptionDataSource()
    }
    
    func beginProject(with extensionContext: PHProjectExtensionContext, projectInfo: PHProjectInfo, completion: @escaping (Error?) -> Void) {
        DispatchQueue.main.async {
            // do initialization here
            completion(nil)
        }
    }
    
    func resumeProject(with extensionContext: PHProjectExtensionContext, completion: @escaping (Error?) -> Void) {
        DispatchQueue.main.async {
            // do initialization here
            completion(nil)
        }
    }
    
    func finishProject(completionHandler completion: @escaping () -> Void) {
        // do any finalization here
        completion()
    }
}
