//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import <AuthenticationServices/AuthenticationServices.h>

@interface ___FILEBASENAME___ () <ASAuthorizationProviderExtensionAuthorizationRequestHandler>

@property ASAuthorizationProviderExtensionAuthorizationRequest *authorizationRequest;

@end

@implementation ___FILEBASENAME___

- (void)loadView {
    [super loadView];
    // Do any additional setup after loading the view.
}

- (NSString *)nibName {
    return @"___FILEBASENAME___";
}

#pragma mark - ASAuthorizationProviderExtensionAuthorizationRequestHandler

- (void)beginAuthorizationWithRequest:(ASAuthorizationProviderExtensionAuthorizationRequest *)request {
    self.authorizationRequest = request;

    // Call this to indicate immediate authorization succeeded.
    NSDictionary<NSString *, NSString *> *authorizationHeaders = @{}; // TODO: Fill in appropriate authorization headers.
    [request completeWithHTTPAuthorizationHeaders:authorizationHeaders];

    // Or present authorization view and call [self.authorizationRequest complete*:] later after handling interactive authorization.
    // [request presentAuthorizationViewControllerWithCompletion:^(BOOL success, NSError * _Nullable error) {
    //     if (error) {
    //         [request completeWithError:error];
    //     }
    // }];
}

@end
