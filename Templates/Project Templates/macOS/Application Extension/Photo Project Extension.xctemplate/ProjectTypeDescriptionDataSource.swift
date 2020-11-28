//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import PhotosUI

class ProjectTypeDescriptionDataSource: NSObject, PHProjectTypeDescriptionDataSource {

    class var rootLevelProjectTypes: [PHProjectTypeDescription] {
        let projectTypes = [PHProjectTypeDescription]()
        // TODO: Fill the array with PHProjectTypeDescription instances representing you project types for the root level.
        return projectTypes
    }
    
    // MARK: - PHProjectTypeDescriptionDataSource
    func subtypes(for projectType: PHProjectType) -> [PHProjectTypeDescription] {
        if projectType == .undefined {
            return type(of: self).rootLevelProjectTypes
        } else {
            let projectTypes = [PHProjectTypeDescription]()
            // TODO: Fill the array with PHProjectTypeDescription instances representing you project types for the given level.
            return projectTypes
        }
    }
    
    func typeDescription(for projectType: PHProjectType) -> PHProjectTypeDescription? {
        // TODO: return the requested project type which was previously invalidated
        return nil
    }
    
    func footerText(forSubtypesOf projectType: PHProjectType) -> NSAttributedString? {
        return nil
    }
    
}
