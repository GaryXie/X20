//
//  XGlobalCorePaths.m
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "XGlobalCorePaths.h"

static NSBundle* globalBundle = nil;

BOOL XIsBundleURL(NSString* URL)
{
    return [URL hasPrefix:@"bundle//"];
}


BOOL XIsDocumentsURL(NSString* URL)
{
    return [URL hasPrefix:@"documents://"];
}


void XSetDefaultBundle(NSBundle* bundle)
{
    [bundle retain];
    [globalBundle release];
    globalBundle = bundle;
}


NSBundle* XGetDefaultBundle()
{
    return (nil != globalBundle) ? globalBundle : [NSBundle mainBundle];
}


NSString* XPathForBundleResource(NSString* relativePath)
{
    NSString* resourcePath = [XGetDefaultBundle() resourcePath];
    return [resourcePath stringByAppendingPathComponent:relativePath];
}


NSString* XPathForDocumentsResource(NSString* relativePath)
{
    static NSString* documentsPath = nil;
    if (nil == documentsPath)
    {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        documentsPath = [[dirs objectAtIndex:0] retain];
    }
    
    return [documentsPath stringByAppendingPathComponent:relativePath];
}

