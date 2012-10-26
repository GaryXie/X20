//
//  X20.m
//  X20
//
//  Created by Gary Xie on 10/26/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "X20.h"
#import "X20Version.h"

@implementation X20

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString*)version {
    return X20Version;
}


#pragma mark -
#pragma mark Version Breakdown
///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSInteger)majorVersion {
    return [[[X20Version componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSInteger)minorVersion {
    return [[[X20Version componentsSeparatedByString:@"."] objectAtIndex:1] intValue];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSInteger)bugfixVersion {
    return [[[X20Version componentsSeparatedByString:@"."] objectAtIndex:2] intValue];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSInteger)hotfixVersion {
    NSArray* components = [X20Version componentsSeparatedByString:@"."];
    if ([components count] > 3) {
        return [[components objectAtIndex:3] intValue];
        
    } else {
        return 0;
    }
}





@end
