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
    if (nil == formatter)
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
    if (nil == formatter)
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
    
    if (diff < X_DAY)
    {
        return [self formatTime];
    } else if (diff < X_5_DAYS)
    {
        static NSDateFormatter *formatter = nil;
        if (nil == formatter)
        {
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = XLocalizedString(@"EEEE", @"Date format: Monday");
            formatter.locale = XCurrentLocale();
        }
        return [formatter stringFromDate:self];
    } else
    {
        static NSDateFormatter *formatter = nil;
        if (nil == formatter)
        {
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = XLocalizedString(@"M/d/yy", @"Date format: 7/27/11");
            formatter.locale = XCurrentLocale();
        }
        return [formatter stringFromDate:self];
    }

}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatDateTime
{
    NSTimeInterval diff = abs([self timeIntervalSinceNow]);
    
    if (diff < X_DAY)
    {
        return [self formatTime];
    } else if (diff < X_5_DAYS)
    {
        static NSDateFormatter* formatter = nil;
        if (nil == formatter)
        {
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = XLocalizedString(@"EEE h:mm a", @"Date format: Mon 1:05 pm");
            formatter.locale = XCurrentLocale();
        }
        return [formatter stringFromDate:self];
    } else
    {
        static NSDateFormatter* formatter = nil;
        if (nil == formatter)
        {
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = XLocalizedString(@"MMM d h:mm a", @"Date format: Jul 27 1:05 pm");
            formatter.locale = XCurrentLocale();
        }
        return [formatter stringFromDate:self];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatRelativeTime
{
    NSTimeInterval elapsed = [self timeIntervalSinceNow];
    if (elapsed > 0)
    {
        if (elapsed <= 1)
        {
            return XLocalizedString(@"in just a moment", @"");
        } else if (elapsed < X_MINUTE)
        {
            int seconds = (int)(elapsed);
            return [NSString stringWithFormat:XLocalizedString(@"in %d seconds", @""), seconds];
        } else if (elapsed < 2 * X_MINUTE)
        {
            return XLocalizedString(@"in about a minute", @"");
        } else if (elapsed < X_HOUR)
        {
            int mins = (int)(elapsed/X_MINUTE);
            return [NSString stringWithFormat:XLocalizedString(@"in %d minutes", @""), mins];
        } else if (elapsed < 1.5 * X_HOUR)
        {
            return XLocalizedString(@"in about an hour", @"");
        } else if (elapsed < X_DAY)
        {
            int hours = (int)((elapsed + X_HOUR * 0.5 ) / X_HOUR);
            return [NSString stringWithFormat:XLocalizedString(@"in %d hours", @""), hours];
        } else
        {
            return [self formatDateTime];
        }
    } else
    {
        elapsed = -elapsed;
        
        if (elapsed <= 1)
        {
            return XLocalizedString(@"just a moment ago", @"");
        } else if (elapsed < X_MINUTE)
        {
            int seconds = (int)(elapsed);
            return [NSString stringWithFormat:XLocalizedString(@"%d seconds ago", @""), seconds];
        } else if (elapsed < 2 * X_MINUTE)
        {
            return XLocalizedString(@"about a minute ago", @"");
        } else if (elapsed < X_HOUR)
        {
            int mins = (int)(elapsed / X_MINUTE);
            return [NSString stringWithFormat:XLocalizedString(@"%d minutes ago", @""), mins];
        } else if (elapsed < 1.5 * X_HOUR)
        {
            return XLocalizedString(@"about an hour ago", @"");
        } else if (elapsed < X_DAY)
        {
            int hours = (int)((elapsed + X_HOUR * 0.5) / X_HOUR);
            return [NSString stringWithFormat:XLocalizedString(@"%d hours ago", @""), hours];
        } else
        {
            return [self formatDateTime];
        }
     }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatShortRelativeTime
{
    NSTimeInterval elapsed = abs([self timeIntervalSinceNow]);
    
    if (elapsed < X_MINUTE)
    {
        return XLocalizedString(@"<1m", @"Date foramt: less than one minute ago");
    } else if (elapsed < X_HOUR)
    {
        int mins = (int)(elapsed / X_MINUTE);
        return [NSString stringWithFormat:XLocalizedString(@"%dm", @"Date format: 50m"), mins];
    } else if (elapsed < X_DAY)
    {
        int hours = (int)((elapsed + X_HOUR * 0.5) / X_HOUR);
        return [NSString stringWithFormat:XLocalizedString(@"%dh", @"Date format: 3d"), hours];
    } else if (elapsed < X_WEEK)
    {
        int day = (int)((elapsed + X_DAY * 0.5) / X_DAY);
        return [NSString stringWithFormat:XLocalizedString(@"%dd", @"Date format: 3d"), day];
    } else
    {
        return [self formatShortTime];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatDay:(NSDateComponents *)today yesterday:(NSDateComponents *)yesterday
{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter)
    {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = XLocalizedString(@"MMMM d", @"Date format: July 27");
        formatter.locale = XCurrentLocale();
    }
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* dateComponents = [calendar components:
                                        NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit
                                        fromDate:self];
    
    if (dateComponents.day == today.day &&
        dateComponents.month == today.month &&
        dateComponents.year == today.year)
    {
        return XLocalizedString(@"Today", @"");
    } else if (dateComponents.day == yesterday.day &&
               dateComponents.month == yesterday.month &&
               dateComponents.year == yesterday.year)
    {
        return XLocalizedString(@"Yesterday", @"");
    } else
    {
        return [formatter stringFromDate:self];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatMonth
{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter)
    {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = XLocalizedString(@"MMMM", @"Date format: July");
        formatter.locale = XCurrentLocale();
    }
    return [formatter stringFromDate:self];
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)formatYear
{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter)
    {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = XLocalizedString(@"yyyy", @"Date format: 2012");
        formatter.locale = XCurrentLocale();
    }
    return [formatter stringFromDate:self];
}

@end
