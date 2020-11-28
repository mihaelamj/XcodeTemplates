//___FILEHEADER___

import CoreAudioKit

public class AudioUnitFactory: NSObject, AUAudioUnitFactory {
    var audioUnit: AUAudioUnit?

	public func beginRequest(with context: NSExtensionContext) {
	
	}

    @objc public func createAudioUnit(with componentDescription: AudioComponentDescription) throws -> AUAudioUnit {
        audioUnit = try ___PACKAGENAMEASIDENTIFIER___AudioUnit(componentDescription: componentDescription, options: [])
        
        return audioUnit!
    }
    
}