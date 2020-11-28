//___FILEHEADER___

import CoreAudioKit

public class ___FILEBASENAME___: AUViewController, AUAudioUnitFactory {
    var audioUnit: AUAudioUnit?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if audioUnit == nil {
            return
        }
        
        // Get the parameter tree and add observers for any parameters that the UI needs to keep in sync with the AudioUnit
    }
    
    public func createAudioUnit(with componentDescription: AudioComponentDescription) throws -> AUAudioUnit {
        audioUnit = try ___PACKAGENAMEASIDENTIFIER___AudioUnit(componentDescription: componentDescription, options: [])
        
        return audioUnit!
    }
    
}
