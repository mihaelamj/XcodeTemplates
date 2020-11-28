//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()
@property IBOutlet NSTextView *myTextView;

@end

@implementation ___FILEBASENAME___

- (NSString *)nibName {
    return @"___FILEBASENAME___";
}

- (void)loadView {
    [super loadView];
    
    // Insert code here to customize the view
    NSLog(@"Input Items = %@", self.extensionContext.inputItems);
    
    NSExtensionItem *sharedItem = [self.extensionContext.inputItems firstObject];
    NSString *text = sharedItem.attributedContentText.string;
    
    if (text.length > 0) {
        self.myTextView.string = text;
    }
}

- (IBAction)send:(id)sender {
    // Note: The extension information in theInfo.plist is set to accept any type of content, but this example code only handles text. You should declare the specific types to be supported by your extension in the extension's Info.plist and then make sure to handle all your supported types.
    NSExtensionItem *outputItem = [[NSExtensionItem alloc] init];
    outputItem.attributedContentText = self.myTextView.attributedString;
    
    NSArray *outputItems = @[outputItem];
    [self.extensionContext completeRequestReturningItems:outputItems completionHandler:nil];
}

- (IBAction)cancel:(id)sender {
    NSError *cancelError = [NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil];
    [self.extensionContext cancelRequestWithError:cancelError];
}

@end

