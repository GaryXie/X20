//
//  XGlobalCorePaths.h
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

// @return YES if the URL begins with "bundle://"
BOOL XIsBundleURL(NSString* URL);

// @return YES if the URL begins with "documents://"
BOOL XIsDocumentsURL(NSString* URL);

// Construct the bundle path. @default nil
void XSetDefaultBundel(NSBundle* bundle);

// Retrieves the default bundle.
NSBundle* XGetDefaultBundle();

// @return The main bundle path concatenated with the given relative path.
NSString* XPathForBundleResource(NSString* relativePath);

// @return The doucments path concatenated with the given relative path.
NSString* XPathForDocumentsResource(NSString* relativePath);

