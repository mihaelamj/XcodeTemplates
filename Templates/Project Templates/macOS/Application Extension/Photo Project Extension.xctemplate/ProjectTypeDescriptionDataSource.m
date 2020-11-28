//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "ProjectTypeDescriptionDataSource.h"

@implementation ProjectTypeDescriptionDataSource

+ (NSArray<PHProjectTypeDescription *> *)rootLevelProjectTypes {
    NSArray<PHProjectTypeDescription *> *projectTypes = @[];
    // TODO: Fill the array with PHProjectTypeDescription instances representing you project types for the root level.
    return projectTypes;
}

#pragma mark - PHProjectTypeDescriptionDataSource

- (nonnull NSArray<PHProjectTypeDescription *> *)subtypesForProjectType:(nonnull PHProjectType)projectType {
    if ([projectType isEqualToString:PHProjectTypeUndefined]) {
        return [self.class rootLevelProjectTypes];
    } else {
        NSArray<PHProjectTypeDescription *> *projectTypes = @[];
        // TODO: Fill the array with PHProjectTypeDescription instances representing you project types for the given level.
        return projectTypes;
    }
}

- (nullable PHProjectTypeDescription *)typeDescriptionForProjectType:(nonnull PHProjectType)projectType {
    // TODO: return the requested project type which was previously invalidated
    return nil;
}

- (nullable NSAttributedString *)footerTextForSubtypesOfProjectType:(nonnull PHProjectType)projectType {
    return nil;
}

@end
