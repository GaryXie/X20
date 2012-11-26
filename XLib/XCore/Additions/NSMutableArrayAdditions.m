//
//  NSMutableArrayAdditions.m
//  X20
//
//  Created by Gary Xie on 11/26/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "NSMutableArrayAdditions.h"

// Core
#import "XCorePreprocessorMacros.h"
#import "XGlobalCore.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
X_FIX_CATEGORY_BUG(NSMutableArrayAdditions)

@implementation NSMutableArray (XCategory)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addNonEmptyString:(NSString *)string
{
    if (XIsStringWithAnyText(string))
    {
        [self addObject:string];
    }
}

@end

