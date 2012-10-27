//
//  XDebug.h
//  X20
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XLOGLEVEL_INFO     5
#define XLOGLEVEL_WARNING  3
#define XLOGLEVEL_ERROR    1

#ifndef XMAXLOGLEVEL
#define XMAXLOGLEVEL XLOGLEVEL_WARNING
#endif

// The general purpose logger. This ignores logging levels.
#ifdef DEBUG
#define XDPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define XDPRINT(xx, ...)  ((void)0)
#endif // #ifdef DEBUG

// Prints the current method's name.
#define XDPRINTMETHODNAME() XDPRINT(@"%s", __PRETTY_FUNCTION__)

// Debug-only assertions.
#ifdef DEBUG

#import <TargetConditionals.h>

#if TARGET_IPHONE_SIMULATOR

int XIsInDebugger();
// We leave the __asm__ in this macro so that when a break occurs, we don't have to step out of
// a "breakInDebugger" function.
#define XDASSERT(xx) { if (!(xx)) { XDPRINT(@"XDASSERT failed: %s", #xx); \
if (XIsInDebugger()) { __asm__("int $3\n" : : ); }; } \
} ((void)0)
#else
#define XDASSERT(xx) { if (!(xx)) { XDPRINT(@"XDASSERT failed: %s", #xx); } } ((void)0)
#endif // #if TARGET_IPHONE_SIMULATOR

#else
#define XDASSERT(xx) ((void)0)
#endif // #ifdef DEBUG

// Log-level based logging macros.
#if XLOGLEVEL_ERROR <= XMAXLOGLEVEL
#define XDERROR(xx, ...)  XDPRINT(xx, ##__VA_ARGS__)
#else
#define XDERROR(xx, ...)  ((void)0)
#endif // #if XLOGLEVEL_ERROR <= XMAXLOGLEVEL

#if XLOGLEVEL_WARNING <= XMAXLOGLEVEL
#define XDWARNING(xx, ...)  XDPRINT(xx, ##__VA_ARGS__)
#else
#define XDWARNING(xx, ...)  ((void)0)
#endif // #if XLOGLEVEL_WARNING <= XMAXLOGLEVEL

#if XLOGLEVEL_INFO <= XMAXLOGLEVEL
#define XDINFO(xx, ...)  XDPRINT(xx, ##__VA_ARGS__)
#else
#define XDINFO(xx, ...)  ((void)0)
#endif // #if XLOGLEVEL_INFO <= XMAXLOGLEVEL

#ifdef DEBUG
#define XDCONDITIONLOG(condition, xx, ...) { if ((condition)) { \
XDPRINT(xx, ##__VA_ARGS__); \
} \
} ((void)0)
#else
#define XDCONDITIONLOG(condition, xx, ...) ((void)0)
#endif // #ifdef DEBUG
