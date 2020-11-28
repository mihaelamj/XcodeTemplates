//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAME___

- (void)loadView {
    [super loadView];
    
    // Insert code here to customize the view
    self.title = NSLocalizedString(@"___PACKAGENAME___", @"Title of the Social Service");
    
    NSLog(@"Input Items = %@", self.extensionContext.inputItems);
}

- (void)didSelectPost {
    // Perform the post operation
    // When the operation is complete (probably asynchronously), the service should notify the success or failure as well as the items that were actually shared
    
    NSExtensionItem *inputItem = self.extensionContext.inputItems.firstObject;
    
    NSExtensionItem *outputItem = [inputItem copy];
    outputItem.attributedContentText = [[NSAttributedString alloc] initWithString:self.contentText attributes:nil];
    // Complete implementation by setting the appropriate value on the output item
    
    NSArray *outputItems = @[outputItem];
    
    [self.extensionContext completeRequestReturningItems:outputItems completionHandler:nil];
}

- (void)didSelectCancel {
    // Cleanup
    
    // Notify the Service was cancelled
    NSError *cancelError = [NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil];
    [self.extensionContext cancelRequestWithError:cancelError];
}

- (BOOL)isContentValid {
    NSInteger messageLength = [[self.contentText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length];
    NSInteger charactersRemaining = 140 - messageLength;
    self.charactersRemaining = @(charactersRemaining);
    
    if (charactersRemaining >= 0) {
        return YES;
    }
    
    return NO;
}

@end
