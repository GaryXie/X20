//
//  NSObjectAdditions.m
//  X20
//
//  Created by Gary.Xie on 11/5/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "NSObjectAdditions.h"
#import "XCorePreprocessorMacros.h"

/**
 * Additions.
 */
X_FIX_CATEGORY_BUG(NSOjbectAdditions)

@implementation NSObject (XAdditions)

-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
{
    NSMethodSignature* sig = [self methodSignatureForSelector:selector];
    
    if(nil == sig)
        return nil;
    
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo invoke];
    if(sig.methodReturnLength)
    {
        id anObject;
        [invo getReturnValue:&anObject];
        return anObject;
    }
    else
    {
        return nil;
    }
}

-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4
{
    NSMethodSignature* sig = [self methodSignatureForSelector:selector];
    
    if(nil == sig)
        return nil;
    
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo setArgument:&p4 atIndex:5];
    [invo invoke];
    if(sig.methodReturnLength)
    {
        id anObject;
        [invo getReturnValue:&anObject];
        return anObject;
    }
    else
    {
        return nil;
    }
}

-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4
          withObject:(id)p5
{
    NSMethodSignature* sig = [self methodSignatureForSelector:selector];
    
    if(nil == sig)
        return nil;
    
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo setArgument:&p4 atIndex:5];
    [invo setArgument:&p5 atIndex:6];
    [invo invoke];
    if(sig.methodReturnLength)
    {
        id anObject;
        [invo getReturnValue:&anObject];
        return anObject;
    }
    else
    {
        return nil;
    }
}

-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4
          withObject:(id)p5 withObject:(id)p6
{
    NSMethodSignature* sig = [self methodSignatureForSelector:selector];
    
    if(nil == sig)
        return nil;
    
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo setArgument:&p4 atIndex:5];
    [invo setArgument:&p5 atIndex:6];
    [invo setArgument:&p6 atIndex:7];
    [invo invoke];
    if(sig.methodReturnLength)
    {
        id anObject;
        [invo getReturnValue:&anObject];
        return anObject;
    }
    else
    {
        return nil;
    }
}

-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4
          withObject:(id)p5 withObject:(id)p6 withObject:(id)p7
{
    NSMethodSignature* sig = [self methodSignatureForSelector:selector];
    
    if(nil == sig)
        return nil;
    
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo setArgument:&p4 atIndex:5];
    [invo setArgument:&p5 atIndex:6];
    [invo setArgument:&p6 atIndex:7];
    [invo setArgument:&p7 atIndex:8];
    [invo invoke];
    if(sig.methodReturnLength)
    {
        id anObject;
        [invo getReturnValue:&anObject];
        return anObject;
    }
    else
    {
        return nil;
    }
}

@end
