//
//  XCorePreprocessorMacros.h
//  X20
//
//  Created by Gary Xie on 10/26/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

/*
 * Borrowed from Apple's AvailabityInternal.h header
 * __AVAILABILITY_INTERNAL_DEPRECATED         __attribute__((deprecated))
 */
#define __XDEPRECATED_METHOD __attribute__((deprecated))

/**
 * Add this macro before each category implementation, so we don't have to use
 * -all_load or -force_load to load object files from static libraries that only contain
 * categories and no classes.
 * See http://developer.apple.com/library/mac/#qa/qa2006/qa1490.html for more info.
 */
//#define XX_FIX_CATEGORY_BUG(name) @interface XX_FIX_CATEGORY_BUG_##name @end \
//@implementation XX_FIX_CATEGORY_BUG_##name @end 

#define X_FIX_CATEGORY_BUG(name) @interface X_FIX_CATEGORY_BUG_##name @end \
@implementation X_FIX_CATEGORY_BUG_##name @end

//#define TT_FIX_CATEGORY_BUG(name) @interface TT_FIX_CATEGORY_BUG_##name @end \
//@implementation TT_FIX_CATEGORY_BUG_##name @end
// Code Management


#pragma -Flags
/*
 * For when the flag might be a set of bits, this will ensure that the exact
 * set of bits in the flag have been set in the value.
 */
#define IS_MASK_SET(value, flag) (((value) & (flag)) == (flag))


#pragma -Time

#define X_MINUTE 60
#define X_HOUR   (60 * TT_MINUTE)
#define X_DAY    (24 * TT_HOUR)
#define X_5_DAYS (5 * TT_DAY)
#define X_WEEK   (7 * TT_DAY)
#define X_MONTH  (30.5 * TT_DAY)
#define X_YEAR   (365 * TT_DAY)

///////////////////////////////////////////////////////////////////////////////////////////////////
// Safe releases

#define X_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }
#define X_INVALIDATE_TIMER(__TIMER) { [__TIMER invalidate]; __TIMER = nil; }

// Release a CoreFoundation object safely.
#define X_RELEASE_CF_SAFELY(__REF) { if (nil != (__REF)) { CFRelease(__REF); __REF = nil; } }
