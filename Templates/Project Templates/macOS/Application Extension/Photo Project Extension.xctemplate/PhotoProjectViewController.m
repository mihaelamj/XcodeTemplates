//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___FILEBASENAME___.h"
#import "ProjectTypeDescriptionDataSource.h"
#import <PhotosUI/PhotosUI.h>

@interface ___FILEBASENAME___ () <PHProjectExtensionController>
@end

@implementation ___FILEBASENAME___

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - PHProjectExtensionController

- (id<PHProjectTypeDescriptionDataSource>)typeDescriptionDataSourceForCategory:(PHProjectCategory)category invalidator:(id<PHProjectTypeDescriptionInvalidator>)invalidator {
    return [[ProjectTypeDescriptionDataSource alloc] init];
}

- (void)beginProjectWithExtensionContext:(PHProjectExtensionContext *)extensionContext projectInfo:(PHProjectInfo *)projectInfo completion:(nonnull void (^)(NSError * ))completion {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        // do initialization here
        completion(nil);
    });
}

- (void)resumeProjectWithExtensionContext:(PHProjectExtensionContext *)extensionContext completion:(nonnull void (^)(NSError * ))completion {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        // do initialization here
        completion(nil);
    });
}

- (void)finishProjectWithCompletionHandler:(void (^)(void))completion {
    // do any finalization here
    completion();
}

#pragma mark - Helper

- (PHProjectExtensionContext *)projectExtensionContext {
    return (PHProjectExtensionContext *)self.extensionContext;
}


@end
