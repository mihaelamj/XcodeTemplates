//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <PhotosUI/PhotosUI.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProjectTypeDescriptionDataSource : NSObject <PHProjectTypeDescriptionDataSource>
@property (nonatomic, readonly, class) NSArray<PHProjectTypeDescription *> *rootLevelProjectTypes;
@end

NS_ASSUME_NONNULL_END
