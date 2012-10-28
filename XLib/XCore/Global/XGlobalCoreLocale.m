//
//  XGlobalCoreLocale.m
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "XGlobalCoreLocale.h"

// Core
#import "XDebug.h"

NSLocale* XCurrentLocale()
{
    NSArray* languages = [NSLocale preferredLanguages];
    if(languages.count > 0)
    {
        NSString* currentLanguage = [languages objectAtIndex:0];
        return [[[NSLocale alloc] initWithLocaleIdentifier:currentLanguage] autorelease];
    }
    else
    {
        return [NSLocale currentLocale];
    }
}


NSString* XLocalizedString(NSString* key, NSString* comment)
{
    static NSBundle* bundle = nil;
    if(nil == bundle)
    {
        NSString* path= [[[NSBundle mainBundle] resourcePath]
                         stringByAppendingPathComponent:@"X20.bundle"];
        bundle = [[NSBundle bundleWithPath:path] retain];
    }
    
    return [bundle localizedStringForKey:key value:key table:nil];
}


NSString* XDescriptionForError(NSError* error)
{
    XDINFO(@"ERROR %@", error);
    
    if([error.domain isEqualToString:NSURLErrorDomain])
    {
        // Note: If new error codes are added here, be sure to document them in the header.
        if(error.code == NSURLErrorTimedOut)
        {
            return XLocalizedString(@"Connection time out", @"");
        }
        else if(error.code == NSURLErrorNotConnectedToInternet)
        {
            return XLocalizedString(@"No internet connection", @"");
        }
        else
        {
            return XLocalizedString(@"Connection error", @"");
        }
    }
    
    return XLocalizedString(@"Error", @"");
}


NSString* XFormatInteger(NSInteger num)
{
    NSNumber* number = [NSNumber numberWithInt:num];
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString* formatted = [formatter stringFromNumber:number];
    [formatter release];
    return formatted;
}

