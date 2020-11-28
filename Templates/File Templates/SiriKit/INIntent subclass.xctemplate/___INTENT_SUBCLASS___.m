//
// ___INTENT_SUBCLASS___.m
//
// This file was automatically generated and should not be edited.
//

#import "___INTENT_SUBCLASS___.h"

@implementation ___INTENT_SUBCLASS___

___INTENT_PROPERTY_IMPLEMENTATIONS___

@end

@interface ___INTENT_SUBCLASS___Response ()

@property (readwrite, NS_NONATOMIC_IOSONLY) ___INTENT_SUBCLASS___ResponseCode code;

@end

@implementation ___INTENT_SUBCLASS___Response

@synthesize code = _code;
___INTENTRESPONSE_PROPERTY_IMPLEMENTATIONS___
- (instancetype)initWithCode:(___INTENT_SUBCLASS___ResponseCode)code userActivity:(nullable NSUserActivity *)userActivity {
    self = [super init];
    if (self) {
        _code = code;
        self.userActivity = userActivity;
    }
    return self;
}
___INTENTRESPONSE_CUSTOM_INITIALIZER_IMPLEMENTATIONS___
@end
