//
//  X20.h
//  X20
//
//  Created by Gary Xie on 10/26/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface X20 : NSObject

/*
**
* @see Three20Version
*/
+ (NSString*)version;


#pragma mark -
#pragma mark Version Breakdown

/**
 * Major release number.
 *
 * Major releases involve large structural changes that will break compatibility
 * with older versions.
 */
+ (NSInteger)majorVersion;

/**
 * Minor release number.
 *
 * Minor releases involve minimal structural changes that might break compatibility
 * with older versions but should only involve minimal effort to transition to.
 */
+ (NSInteger)minorVersion;

/**
 * Bugfix release number.
 *
 * Bugfix releases involve no structural modifications, but may introduce new code and
 * fix existing bugs.
 */
+ (NSInteger)bugfixVersion;

/**
 * Hotfix release number.
 *
 * Hotfix releases fix crashing bugs and compilation errors that may have slipped through the
 * release process.
 */
+ (NSInteger)hotfixVersion;


@end
