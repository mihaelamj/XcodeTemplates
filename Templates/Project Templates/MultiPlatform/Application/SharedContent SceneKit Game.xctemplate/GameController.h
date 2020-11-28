//___FILEHEADER___

#import <SceneKit/SceneKit.h>


@interface ___FILEBASENAME___ : NSObject <SCNSceneRendererDelegate>

@property (strong, readonly) SCNScene *scene;
@property (strong, readonly) id <SCNSceneRenderer> sceneRenderer;

- (instancetype)initWithSceneRenderer:(id <SCNSceneRenderer>)sceneRenderer;

- (void)highlightNodesAtPoint:(CGPoint)point;

@end
