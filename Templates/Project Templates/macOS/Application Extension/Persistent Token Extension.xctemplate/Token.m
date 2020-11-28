//___FILEHEADER___

#import "Token.h"

@implementation Token

- (TKTokenSession *)token:(TKToken *)token createSessionWithError:(NSError **)error {
    return [[TokenSession alloc] initWithToken:self];
}

@end
