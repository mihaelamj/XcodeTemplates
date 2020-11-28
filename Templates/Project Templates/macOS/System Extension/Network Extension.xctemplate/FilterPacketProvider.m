//___FILEHEADER___

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAME___

- (void)startFilterWithCompletionHandler:(void (^)(NSError *error))completionHandler {

	self.packetHandler = ^NEFilterPacketProviderVerdict(NEFilterPacketContext * _Nonnull context, nw_interface_t  _Nonnull interface, NETrafficDirection direction, const void * _Nonnull packetBytes, const size_t packetLength) {
		return NEFilterPacketProviderVerdictAllow;
	};
}

- (void)stopFilterWithReason:(NEProviderStopReason)reason completionHandler:(void (^)(void))completionHandler {
    // Add code to clean up filter resources.
    completionHandler();
}

@end
