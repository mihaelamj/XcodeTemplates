//___FILEHEADER___

#import "___FILEBASENAME___.h"

#import "SafariExtensionViewController.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAME___

- (void)messageReceivedWithName:(NSString *)messageName fromPage:(SFSafariPage *)page userInfo:(NSDictionary *)userInfo {
    // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
    [page getPagePropertiesWithCompletionHandler:^(SFSafariPageProperties *properties) {
        NSLog(@"The extension received a message (%@) from a script injected into (%@) with userInfo (%@)", messageName, properties.url, userInfo);
    }];
}

- (void)toolbarItemClickedInWindow:(SFSafariWindow *)window {
    // This method will be called when your toolbar item is clicked.
    NSLog(@"The extension's toolbar item was clicked");
}

- (void)validateToolbarItemInWindow:(SFSafariWindow *)window validationHandler:(void (^)(BOOL enabled, NSString *badgeText))validationHandler {
    // This method will be called whenever some state changes in the passed in window. You should use this as a chance to enable or disable your toolbar item and set badge text.
    validationHandler(YES, nil);
}

- (SFSafariExtensionViewController *)popoverViewController {
    return [SafariExtensionViewController sharedController];
}

@end
