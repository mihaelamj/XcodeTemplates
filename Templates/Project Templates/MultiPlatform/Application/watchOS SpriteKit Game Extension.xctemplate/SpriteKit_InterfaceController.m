//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "GameScene.h"

@interface ___FILEBASENAME___ ()

@property (strong, nonatomic) IBOutlet WKInterfaceSKScene *skInterface;

@end


@implementation ___FILEBASENAME___

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    GameScene *scene = [GameScene newGameScene];
    
    // Present the scene
    [self.skInterface presentScene:scene];
    
    // Use a preferredFramesPerSecond that will maintain consistent frame rate
    self.skInterface.preferredFramesPerSecond = 30;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end
