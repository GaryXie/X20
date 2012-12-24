//
//  XEntityTables.h
//  X20
//
//  Created by Gary.Xie on 12/24/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 * Standard entity tables for use with XML parsers.
 * Supported entity tables: ISO 8859-1.
 * Each table is a dictionary of entity names to NSData objects containing the character.
 */
@interface XEntityTables : NSObject
{
    NSDictionary* _iso88591;
}

// Entity table for ISO 8859-1
@property (nonatomic, readonly) NSDictionary* iso88591;

@end


@interface XEntityTables (XSingleton)

// Access the singleton instance: [[XEntityTables sharedInstance] <methods>]
+ (XEntityTables*)sharedInstance;

// Release the shared instance.
+ (void)releaseSharedInstance;

@end



