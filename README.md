libFLEX
========

Put the libFLEX.dylib to your jailbroken iOS Device's `/Library/MobileSubstrate/DynamicLibraries` folder, then you can use Flipboard/FLEX in any app.


## TL;DR


Flipboard just open source FLEX (Flipboard Explorer), a set of in-app debugging and exploration tools for iOS development. 

![View Hierarchy Exploration](http://engineering.flipboard.com/assets/flex/basic-view-exploration.gif)


 And it tell us we can use it learn from other app by code injection. 

![Springboard Lock Screen](http://engineering.flipboard.com/assets/flex/flex-readme-reverse-1.png) ![Springboard Home Screen](http://engineering.flipboard.com/assets/flex/flex-readme-reverse-2.png)


But the document just said : The code injection is left as an exercise for the reader.

![cry](http://pic.sc.chinaz.com/Files/pic/faces/2301/33.gif)

I never do some job about Jailbreak development， how can I do it？

And I Read a blog introducing the way do it <http://itony.me/774.html>

![happy](http://img5.douban.com/lpic/s10299848.jpg)

So, Just Create a iOS Dynamic Project (I highly recommend use [iOSOpenDev](http://www.iosopendev.com/) ), clone the FLEX library code and link it to your project( I highly recommend use [cocoapods](http://cocoapods.org/) ), and copy the code below and paste to your project:

```objc
#import "libFlex.h"
#import <UIKit/UIKit.h>
#import "FLEXManager.h"
 
@implementation libFlex
 
- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(appLaunched:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
    }
    return self;
}
 
- (void)appLaunched:(NSNotification *)notification
{
    NSLog(@"======================= libFlex dylib show ========================");
    
    [[FLEXManager sharedManager] showExplorer];
}
 
@end
 
static void __attribute__((constructor)) initialize(void)
{
    NSLog(@"======================= libFlex dylib initialize ========================");
    
    static libFlex *entrance;
    entrance = [[libFlex alloc] init];
}
```


Complie it and drop the libFLEX.dylib file to your jailbroken iOS Device's `/Library/MobileSubstrate/DynamicLibraries` folder. Pretty easy.




