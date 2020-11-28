//___FILEHEADER___

#import "ViewController.h"
#import <SafariServices/SFSafariApplication.h>
#import <SafariServices/SFSafariExtensionManager.h>
#import <SafariServices/SFSafariExtensionState.h>

static NSString * const appName = @"___VARIABLE_productName___";
static NSString * const extensionBundleIdentifier = @"___VARIABLE_bundleIdentifierPrefix:bundleIdentifier___.___PROJECTNAME:rfc1034Identifier___.Extension";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.appNameLabel.stringValue = appName;

    [SFSafariExtensionManager getStateOfSafariExtensionWithIdentifier:extensionBundleIdentifier completionHandler:^(SFSafariExtensionState * _Nullable state, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!state) {
                // Insert code to inform the user something went wrong.
                return;
            }

            if (state.isEnabled)
                self.appNameLabel.stringValue = [NSString stringWithFormat:@"%@'s extension is currently on.", appName];
            else
                self.appNameLabel.stringValue = [NSString stringWithFormat:@"%@'s extension is currently off. You can turn it on in Safari Extensions preferences.", appName];
        });
    }];
}

- (IBAction)openSafariExtensionPreferences:(id)sender {
    [SFSafariApplication showPreferencesForExtensionWithIdentifier:extensionBundleIdentifier completionHandler:^(NSError * _Nullable error) {
        if (error) {
            // Insert code to inform the user something went wrong.
            return;
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            [NSApplication.sharedApplication terminate:nil];
        });
    }];
}

@end
