//___FILEHEADER___

#import "Token.h"

@implementation TokenDriver

- (TKToken *)tokenDriver:(TKTokenDriver *)driver tokenForConfiguration:(TKTokenConfiguration *)configuration error:(NSError **)error {
    return [[Token alloc] initWithTokenDriver:self instanceID:configuration.instanceID];
}

@end
