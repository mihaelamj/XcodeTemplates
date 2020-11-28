//___FILEHEADER___

#import "___PACKAGENAMEASIDENTIFIER___AudioUnit.h"
#import "AudioUnitFactory.h"


@implementation AudioUnitFactory

- (void)beginRequestWithExtensionContext:(NSExtensionContext *)context {

}

- (AUAudioUnit *)createAudioUnitWithComponentDescription:(AudioComponentDescription)desc error:(NSError **)error {
	return [[___PACKAGENAMEASIDENTIFIER___AudioUnit alloc] initWithComponentDescription:desc error:error];
}

@end

