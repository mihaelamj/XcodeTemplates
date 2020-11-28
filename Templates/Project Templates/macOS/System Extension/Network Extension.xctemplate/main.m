//___FILEHEADER___

#import <Foundation/Foundation.h>
#import <NetworkExtension/NetworkExtension.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [NEProvider startSystemExtensionMode];
    }
    
    dispatch_main();
}
