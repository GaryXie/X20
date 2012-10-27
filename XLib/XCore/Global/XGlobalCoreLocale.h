//
//  XGlobalCoreLocale.h
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * Get the current system locale chosen by the user.
 * This is necessary because [NSLocale currentLocale] alwarys returns en_US.
 */
NSLocale* XCurrentLocale();


// @return A localized string from the X20 bundle.
NSString* XLocalizedString(NSString* key, NSString* comment);


/**
 * @return A localized description for NSURLErrorDomain errors.
 *
 * Error codes handled:
 * - NSURLErrorTimedOut
 * - NSURLErrorNotConnectedToInternet
 * - All other NSURLErrorDomain errors fall through to "Connection Error".
 */
NSString* XDescriptionForError(NSError* error);

// @return The given number formatted as XX,XXX,XXX.XX
NSString* XFormatInteger(NSInteger num);
