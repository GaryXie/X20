//
//  XAvailability.h
//  X20
//
//  Created by Gary.Xie on 10/30/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * SDK definitions useful in availability checks for conditionally compiling code.
 *
 * Example:
 *
 *     #if __IPHONE_OS_VERSION_MAX_ALLOWED >= TTIOS_3_2
 *       // This code will only compile on versions >= iOS 3.2
 *     #endif
 *
 * These macros are defined unconditionally and separately from the __IPHONE_* macros
 * because there might be methods that use the #ifdef state of one of the __IPHONE_ macros
 * to conditionally compile their code (however incorrect this may be).
 */
#define XIOS_2_0     20000
#define XIOS_2_1     20100
#define XIOS_2_2     20200
#define XIOS_3_0     30000
#define XIOS_3_1     30100
#define XIOS_3_2     30200
#define XIOS_4_0     40000
#define XIOS_4_1     40100
#define XIOS_4_2     40200

/**
 * Flesh out the known SDK version numbers.
 */
#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_2_0
#define kCFCoreFoundationVersionNumber_iPhoneOS_2_0 478.23
#endif

#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_2_1
#define kCFCoreFoundationVersionNumber_iPhoneOS_2_1 478.26
#endif

#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_2_2
#define kCFCoreFoundationVersionNumber_iPhoneOS_2_2 478.29
#endif

#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_3_0
#define kCFCoreFoundationVersionNumber_iPhoneOS_3_0 478.47
#endif

#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_3_1
#define kCFCoreFoundationVersionNumber_iPhoneOS_3_1 478.52
#endif

#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_3_2
#define kCFCoreFoundationVersionNumber_iPhoneOS_3_2 478.61
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_4_0
#define kCFCoreFoundationVersionNumber_iOS_4_0 550.32
#endif

/**
 * Checks whether the device's OS version is at least the given version number.
 *
 * @param versionNumber Any value of kCFCoreFoundationVersionNumber from above.
 */
BOOL XDeviceOSVersionIsAtLeast(double versionNumber);

/**
 * Use NSClassFromString to fetch the popover controller class.
 *
 * The class is cached to avoid repeated lookups.
 */
Class XUIPopoverControllerClass();
