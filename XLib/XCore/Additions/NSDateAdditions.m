//
//  NSDateAdditions.m
//  X20
//
//  Created by Gary.Xie on 11/25/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "NSDateAdditions.h"

// Core
#import "XCorePreprocessorMacros.h"
#import "XGlobalCoreLocale.h"

// Additions
X_FIX_CATEGORY_BUG(NSDateAdditions)

@implementation NSDate (XCategory)
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSDate *)dateWithToday
{
    return [[NSDate date] dateAtMidnight];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDate *)dateAtMidnight
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorianCalendar
                               components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                               fromDate:[NSDate date]];
    
    NSDate *midnight = [gregorianCalendar dateFromComponents:comps];
    [gregorianCalendar release];
    return midnight;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatTime
{
    static NSDateFormatter *formatter = nil;
    if(nil == formatter)
    {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = XLocalizedString(@"h:mm a", @"Date format: 1:05 pm");
        formatter.locale = XCurrentLocale();
    }
    return [formatter stringFromDate:self];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatDate
{
    static NSDateFormatter *formatter = nil;
    if(nil == formatter)
    {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = XLocalizedString(@"EEEE, LLLL d, YYYY", @"Date format: Monday, July 27, 2012");
        formatter.locale = XCurrentLocale();
    }
    return [formatter stringFromDate:self];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatShortTime
{
    NSTimeInterval diff = abs([self timeIntervalSinceNow]);
    
    if(diff < X_DAY)
    {
        return [self formatTime];
    }
}
//- (NSString*)formatShortTime {
//    NSTimeInterval diff = abs([self timeIntervalSinceNow]);
//    
//    if (diff < TT_DAY) {
//        return [self formatTime];
//        
//    } else if (diff < TT_5_DAYS) {
//        static NSDateFormatter* formatter = nil;
//        if (nil == formatter) {
//            formatter = [[NSDateFormatter alloc] init];
//            formatter.dateFormat = TTLocalizedString(@"EEEE", @"Date format: Monday");
//            formatter.locale = TTCurrentLocale();
//        }
//        return [formatter stringFromDate:self];
//        
//    } else {
//        static NSDateFormatter* formatter = nil;
//        if (nil == formatter) {
//            formatter = [[NSDateFormatter alloc] init];
//            formatter.dateFormat = TTLocalizedString(@"M/d/yy", @"Date format: 7/27/09");
//            formatter.locale = TTCurrentLocale();
//        }
//        return [formatter stringFromDate:self];
//    }
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSString*)formatDateTime {
//    NSTimeInterval diff = abs([self timeIntervalSinceNow]);
//    if (diff < TT_DAY) {
//        return [self formatTime];
//        
//    } else if (diff < TT_5_DAYS) {
//        static NSDateFormatter* formatter = nil;
//        if (nil == formatter) {
//            formatter = [[NSDateFormatter alloc] init];
//            formatter.dateFormat = TTLocalizedString(@"EEE h:mm a", @"Date format: Mon 1:05 pm");
//            formatter.locale = TTCurrentLocale();
//        }
//        return [formatter stringFromDate:self];
//        
//    } else {
//        static NSDateFormatter* formatter = nil;
//        if (nil == formatter) {
//            formatter = [[NSDateFormatter alloc] init];
//            formatter.dateFormat = TTLocalizedString(@"MMM d h:mm a", @"Date format: Jul 27 1:05 pm");
//            formatter.locale = TTCurrentLocale();
//        }
//        return [formatter stringFromDate:self];
//    }
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSString*)formatRelativeTime {
//    NSTimeInterval elapsed = [self timeIntervalSinceNow];
//    if (elapsed > 0) {
//        if (elapsed <= 1) {
//            return TTLocalizedString(@"in just a moment", @"");
//        }
//        else if (elapsed < TT_MINUTE) {
//            int seconds = (int)(elapsed);
//            return [NSString stringWithFormat:TTLocalizedString(@"in %d seconds", @""), seconds];
//            
//        }
//        else if (elapsed < 2*TT_MINUTE) {
//            return TTLocalizedString(@"in about a minute", @"");
//        }
//        else if (elapsed < TT_HOUR) {
//            int mins = (int)(elapsed/TT_MINUTE);
//            return [NSString stringWithFormat:TTLocalizedString(@"in %d minutes", @""), mins];
//        }
//        else if (elapsed < TT_HOUR*1.5) {
//            return TTLocalizedString(@"in about an hour", @"");
//        }
//        else if (elapsed < TT_DAY) {
//            int hours = (int)((elapsed+TT_HOUR/2)/TT_HOUR);
//            return [NSString stringWithFormat:TTLocalizedString(@"in %d hours", @""), hours];
//        }
//        else {
//            return [self formatDateTime];
//        }
//    }
//    else {
//        elapsed = -elapsed;
//        
//        if (elapsed <= 1) {
//            return TTLocalizedString(@"just a moment ago", @"");
//            
//        } else if (elapsed < TT_MINUTE) {
//            int seconds = (int)(elapsed);
//            return [NSString stringWithFormat:TTLocalizedString(@"%d seconds ago", @""), seconds];
//            
//        } else if (elapsed < 2*TT_MINUTE) {
//            return TTLocalizedString(@"about a minute ago", @"");
//            
//        } else if (elapsed < TT_HOUR) {
//            int mins = (int)(elapsed/TT_MINUTE);
//            return [NSString stringWithFormat:TTLocalizedString(@"%d minutes ago", @""), mins];
//            
//        } else if (elapsed < TT_HOUR*1.5) {
//            return TTLocalizedString(@"about an hour ago", @"");
//            
//        } else if (elapsed < TT_DAY) {
//            int hours = (int)((elapsed+TT_HOUR/2)/TT_HOUR);
//            return [NSString stringWithFormat:TTLocalizedString(@"%d hours ago", @""), hours];
//            
//        } else {
//            return [self formatDateTime];
//        }
//    }
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSString*)formatShortRelativeTime {
//    NSTimeInterval elapsed = abs([self timeIntervalSinceNow]);
//    
//    if (elapsed < TT_MINUTE) {
//        return TTLocalizedString(@"<1m", @"Date format: less than one minute ago");
//        
//    } else if (elapsed < TT_HOUR) {
//        int mins = (int)(elapsed / TT_MINUTE);
//        return [NSString stringWithFormat:TTLocalizedString(@"%dm", @"Date format: 50m"), mins];
//        
//    } else if (elapsed < TT_DAY) {
//        int hours = (int)((elapsed + TT_HOUR / 2) / TT_HOUR);
//        return [NSString stringWithFormat:TTLocalizedString(@"%dh", @"Date format: 3h"), hours];
//        
//    } else if (elapsed < TT_WEEK) {
//        int day = (int)((elapsed + TT_DAY / 2) / TT_DAY);
//        return [NSString stringWithFormat:TTLocalizedString(@"%dd", @"Date format: 3d"), day];
//        
//    } else {
//        return [self formatShortTime];
//    }
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSString*)formatDay:(NSDateComponents*)today yesterday:(NSDateComponents*)yesterday {
//    static NSDateFormatter* formatter = nil;
//    if (nil == formatter) {
//        formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = TTLocalizedString(@"MMMM d", @"Date format: July 27");
//        formatter.locale = TTCurrentLocale();
//    }
//    
//    NSCalendar* cal = [NSCalendar currentCalendar];
//    NSDateComponents* day = [cal components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit
//                                   fromDate:self];
//    
//    if (day.day == today.day && day.month == today.month && day.year == today.year) {
//        return TTLocalizedString(@"Today", @"");
//        
//    } else if (day.day == yesterday.day && day.month == yesterday.month
//               && day.year == yesterday.year) {
//        return TTLocalizedString(@"Yesterday", @"");
//        
//    } else {
//        return [formatter stringFromDate:self];
//    }
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSString*)formatMonth {
//    static NSDateFormatter* formatter = nil;
//    if (nil == formatter) {
//        formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = TTLocalizedString(@"MMMM", @"Date format: July");
//        formatter.locale = TTCurrentLocale();
//    }
//    return [formatter stringFromDate:self];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSString*)formatYear {
//    static NSDateFormatter* formatter = nil;
//    if (nil == formatter) {
//        formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = TTLocalizedString(@"yyyy", @"Date format: 2009");
//        formatter.locale = TTCurrentLocale();
//    }
//    return [formatter stringFromDate:self];
//}
//@implementation NSDateAdditions

@end
