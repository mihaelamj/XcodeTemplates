//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import <SceneKit/SceneKit.h>
#import "GameController.h"

@interface ___FILEBASENAME___ ()

@property (readonly) SCNView *gameView;
@property (strong, nonatomic) GameController *gameController;

@end

@implementation ___FILEBASENAME___

- (SCNView *)gameView {
    return (SCNView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gameController = [[GameController alloc] initWithSceneRenderer:self.gameView];
    
    // Allow the user to manipulate the camera
    self.gameView.allowsCameraControl = YES;
    
    // Show statistics such as fps and timing information
    self.gameView.showsStatistics = YES;
    
    // Configure the view
    self.gameView.backgroundColor = [NSColor blackColor];
    
    // Add a click gesture recognizer
    NSClickGestureRecognizer *clickGesture = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(handleClick:)];
    NSMutableArray *gestureRecognizers = [NSMutableArray array];
    [gestureRecognizers addObject:clickGesture];
    [gestureRecognizers addObjectsFromArray:self.gameView.gestureRecognizers];
    self.gameView.gestureRecognizers = gestureRecognizers;
}

- (void) handleClick:(NSGestureRecognizer*)gestureRecognize {
    // Highlight the clicked nodes
    CGPoint p = [gestureRecognize locationInView:self.gameView];
    [self.gameController highlightNodesAtPoint:p];
}

@end
