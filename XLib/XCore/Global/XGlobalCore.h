//
//  XGlobalCore.h
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

// Typically used with arrays of delegates
NSMutableArray* XCreateNonRetainingArray();

// Typically used with dictionaries of delegates.
NSMutableDictionary* XCreateNonRetainingDictionary();

// Tests if an object is an array which is not empty.
BOOL XIsArrayWithItems(id object);

// Tests if an objects is a set which is not empty.
BOOL XIsSetWithItems(id object);

// Tests if an object is a string which is not empty.
BOOL XIsStringWithAnyText(id object);

// Swap the two method implementations on the given class.
void XSwapMethods(Class cls, SEL originalSel, SEL newSel);



