//
//  XGlobalCoreRects.h
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// @return a rectangle with dx and dy subtracted from the width and height, respectively.
CGRect XRectContract(CGRect rect, CGFloat dx, CGFloat dy);

// @return a rectangle whose origin has been offset by dx, dy, and whose size has been
CGRect XRectShift(CGRect rect, CGFloat dx, CGFloat dy);

// @return a rectangle with the given insets.
CGRect XRectInset(CGRect rect, UIEdgeInsets insets);

