//
//  XGlobalCore.m
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "XGlobalCore.h"

#import <objc/runtime.h>

// No-ops for non-retaining objects.
static const void* XRetainNoOp(CFAllocatorRef allocator, const void *value) {return value;}
static void XReleaseNoOp(CFAllocatorRef allocator, const void *value) {}

NSMutableArray* XCreateNonReatiningArray()
{
    CFArrayCallBacks callbacks = kCFTypeArrayCallBacks;
    callbacks.retain = XRetainNoOp;
    callbacks.release = XReleaseNoOp;
    return (NSMutableArray*)CFArrayCreateMutable(nil, 0, &callbacks);
}

NSMutableDictionary* XCreateNonRetainingDictionary()
{
    CFDictionaryKeyCallBacks keyCallbacks = kCFTypeDictionaryKeyCallBacks;
    CFDictionaryValueCallBacks valueCallbacks = kCFTypeDictionaryValueCallBacks;
    valueCallbacks.retain = XRetainNoOp;
    valueCallbacks.release = XReleaseNoOp;
    return (NSMutableDictionary*)CFDictionaryCreateMutable(nil, 0, &keyCallbacks, &valueCallbacks);
}

BOOL XIsArrayWithItems(id object)
{
    return [object isKindOfClass:[NSArray class]] && [(NSArray*)object count] > 0;
}

BOOL XIsSetWithItems(id object)
{
    return [object isKindOfClass:[NSSet class]] && [(NSSet*)object count] > 0;
}

BOOL XIsStringWithAnyText(id object)
{
    return [object isKindOfClass:[NSString class]] && [(NSString*)object length] > 0;
}

void XSwapMethods(Class cls, SEL originalSel, SEL newSel)
{
    Method originalMethod = class_getClassMethod(cls, originalSel);
    Method newMethod = class_getClassMethod(cls, newSel);
    method_exchangeImplementations(originalMethod, newMethod);
}


