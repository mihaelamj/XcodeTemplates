//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___PACKAGENAMEASIDENTIFIER___AudioUnit.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAME___ {
    AUAudioUnit *audioUnit;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    if (!audioUnit) {
        return;
    }
    
    // Get the parameter tree and add observers for any parameters that the UI needs to keep in sync with the AudioUnit
}

- (AUAudioUnit *)createAudioUnitWithComponentDescription:(AudioComponentDescription)desc error:(NSError **)error {
    audioUnit = [[___PACKAGENAMEASIDENTIFIER___AudioUnit alloc] initWithComponentDescription:desc error:error];
    
    return audioUnit;
}

@end
