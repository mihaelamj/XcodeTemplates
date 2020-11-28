//___FILEHEADER___

#import "___FILEBASENAME___.h"

#if TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#endif

@interface ___FILEBASENAME___ ()

@property (strong, nonatomic) SCNScene *scene;
@property (strong, nonatomic) id <SCNSceneRenderer> sceneRenderer;

@end

@implementation ___FILEBASENAME___

- (instancetype)initWithSceneRenderer:(id <SCNSceneRenderer>)sceneRenderer {
    self = [super init];
    if (self) {
        self.sceneRenderer = sceneRenderer;
        self.sceneRenderer.delegate = self;
        
        // create a new scene
        SCNScene *scene = [SCNScene sceneNamed:@"Art.scnassets/ship.scn"];
        
        // retrieve the ship node
        SCNNode *ship = [scene.rootNode childNodeWithName:@"ship" recursively:YES];
        
        // animate the 3d object
        [ship runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:2 z:0 duration:1]]];
        
        self.scene = scene;
        self.sceneRenderer.scene = scene;
    }
    return self;
}

- (void)highlightNodesAtPoint:(CGPoint)point {
    NSArray<SCNHitTestResult *> *hitResults = [self.sceneRenderer hitTest:point options:nil];
    for (SCNHitTestResult *result in hitResults) {
        // get its material
        SCNMaterial *material = result.node.geometry.firstMaterial;
        
        // highlight it
        [SCNTransaction begin];
        [SCNTransaction setAnimationDuration:0.5];
        
        // on completion - unhighlight
        [SCNTransaction setCompletionBlock:^{
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            
            material.emission.contents = [SCNColor blackColor];
            
            [SCNTransaction commit];
        }];
        
        material.emission.contents = [SCNColor redColor];
        
        [SCNTransaction commit];
    }
}

- (void)renderer:(id <SCNSceneRenderer>)renderer updateAtTime:(NSTimeInterval)time {
    // Called before each frame is rendered
}

@end
