//
//  FLEX.m
//  FLEX
//
//  Created by xiangyu on 7/31/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "FLEX.h"
#import <UIKit/UIKit.h>
#import <FLEX/FLEXManager.h>

@implementation FLEX

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
    
    static FLEX *entrance;
    entrance = [[FLEX alloc] init];
}