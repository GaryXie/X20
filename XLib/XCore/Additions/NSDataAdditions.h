//
//  NSDataAdditions.h
//  X20
//
//  Created by Gary.Xie on 11/13/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (XAdditions)

// Calculate the md5 hash of this data using CC_MD5.
@property (nonatomic, readonly) NSString* md5Hash;

// Calculate the SHA1 hash of this data using CC_SHA1.
@property (nonatomic, readonly) NSString* sha1Hash;

// Create an NSData from a base64 encoded representation padding '=' characters are optional. Whitespace is ignored.
+ (id)dataWithBytes64EncodedString:(NSString*)string;

// Marshal the data into a base64 encoded representation
- (NSString *)base64Encoding;

@end
