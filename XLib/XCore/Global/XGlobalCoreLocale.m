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
    return nil;
}
/*
///////////////////////////////////////////////////////////////////////////////////////////////////
NSLocale* TTCurrentLocale() {
    NSArray* languages = [NSLocale preferredLanguages];
    if (languages.count > 0) {
        NSString* currentLanguage = [languages objectAtIndex:0];
        return [[[NSLocale alloc] initWithLocaleIdentifier:currentLanguage] autorelease];
        
    } else {
        return [NSLocale currentLocale];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSString* TTLocalizedString(NSString* key, NSString* comment) {
    static NSBundle* bundle = nil;
    if (nil == bundle) {
        NSString* path = [[[NSBundle mainBundle] resourcePath]
                          stringByAppendingPathComponent:@"Three20.bundle"];
        bundle = [[NSBundle bundleWithPath:path] retain];
    }
    
    return [bundle localizedStringForKey:key value:key table:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSString* TTDescriptionForError(NSError* error) {
    TTDINFO(@"ERROR %@", error);
    
    if ([error.domain isEqualToString:NSURLErrorDomain]) {
        // Note: If new error codes are added here, be sure to document them in the header.
        if (error.code == NSURLErrorTimedOut) {
            return TTLocalizedString(@"Connection Timed Out", @"");
            
        } else if (error.code == NSURLErrorNotConnectedToInternet) {
            return TTLocalizedString(@"No Internet Connection", @"");
            
        } else {
            return TTLocalizedString(@"Connection Error", @"");
        }
    }
    return TTLocalizedString(@"Error", @"");
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSString* TTFormatInteger(NSInteger num) {
    NSNumber* number = [NSNumber numberWithInt:num];
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString* formatted = [formatter stringFromNumber:number];
    [formatter release];
    return formatted;
}
*/