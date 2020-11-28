//___FILEHEADER___

#import "Token.h"

@implementation Token

- (instancetype)initWithSmartCard:(TKSmartCard *)smartCard AID:(NSData *)AID tokenDriver:(TokenDriver *)tokenDriver error:(NSError **)error {
    NSString *instanceID = @"token_instance_id"; // Fill in a unique persistent identifier of the token instance.
    if (self = [super initWithSmartCard:smartCard AID:AID instanceID:instanceID tokenDriver:tokenDriver]) {
        NSMutableArray<TKTokenKeychainItem *> *items = [NSMutableArray array];
        // Insert code here to enumerate token objects and populate keychainContents with instances of TKTokenKeychainCertificate, TKTokenKeychainKey, etc.
        [self.keychainContents fillWithItems:items];
    }
    return self;
}

- (TKTokenSession *)token:(TKToken *)token createSessionWithError:(NSError **)error {
    return [[TokenSession alloc] initWithToken:self];
}

@end
