//
//  XGlobalCoreRects.m
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "XGlobalCoreRects.h"

CGRect XRectContract(CGRect rect, CGFloat dx, CGFloat dy)
{
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width - dx, rect.size.height - dy);
}


CGRect XRectShift(CGRect rect, CGFloat dx, CGFloat dy)
{
    return CGRectOffset(XRectContract(rect, dx, dy), dx, dy);
}

CGRect XRectInset(CGRect rect, UIEdgeInsets insets)
{
    return CGRectMake(rect.origin.x + insets.left, rect.origin.y + insets.top,
                      rect.size.width - (insets.left + insets.right),
                      rect.size.height - (insets.top + insets.bottom));
}

