//___FILEHEADER___

#import "Token.h"

@implementation TokenDriver

- (TKSmartCardToken *)tokenDriver:(TKSmartCardTokenDriver *)driver createTokenForSmartCard:(TKSmartCard *)smartCard AID:(NSData *)AID error:(NSError **)error {
    return [[Token alloc] initWithSmartCard:smartCard AID:AID tokenDriver:self error:error];
}

@end
