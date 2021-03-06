//
//  NSMutableDictionaryAdditions.m
//  X20
//
//  Created by Gary Xie on 11/26/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "NSMutableDictionaryAdditions.h"

// Core
#import "XCorePreprocessorMacros.h"
#import "XGlobalCore.h"

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
X_FIX_CATEGORY_BUG(NSMutableDictionaryAdditions)

@implementation NSMutableDictionary (XCategory)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setNonEmptyString:(NSString *)string forKey:(id)key
{
    if (XIsStringWithAnyText(string))
    {
        [self setObject:string forKey:key];
    }
}

@end



