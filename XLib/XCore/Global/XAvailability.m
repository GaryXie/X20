//
//  XAvailability.m
//  X20
//
//  Created by Gary.Xie on 10/30/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "XAvailability.h"

BOOL XDeviceOSVersionIsAtLeast(double versionNumber)
{
    return kCFCoreFoundationVersionNumber >= versionNumber;
}


Class XUIPopoverControllerClass()
{
    static Class sClass = nil;
    if (nil == sClass)
    {
        sClass = NSClassFromString(@"UIPopoverController");
    }
    return sClass;
}

