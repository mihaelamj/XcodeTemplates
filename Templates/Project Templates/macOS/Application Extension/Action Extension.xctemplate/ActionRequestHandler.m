//___FILEHEADER___

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAME___

- (void)beginRequestWithExtensionContext:(NSExtensionContext *)context {
    // Get the input item
    NSExtensionItem *item = context.inputItems.firstObject;
    NSAttributedString *content = item.attributedContentText;
    NSLog(@"Content %@", content);

    // Transform the content
    NSMutableAttributedString *newContent = [content mutableCopy];

    if (newContent.length > 0) {
        [newContent.mutableString appendString:@"ABC"];
        item.attributedContentText = newContent;

        // Notify the action is done with success
        [context completeRequestReturningItems:@[item] completionHandler:nil];
    } else {
        // Notify the action failed to complete, use an appropriate error
        [context cancelRequestWithError:[NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil]];
    }
}

@end
