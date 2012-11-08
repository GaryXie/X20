//
//  NSObjectAdditions.h
//  X20
//
//  Created by Gary.Xie on 11/5/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XAdditions)

// Additional performSelector signatures that support up to 7 arguments
-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3;
-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4;
-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
          withObject:(id)p4 withObject:(id)p5;
-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
          withObject:(id)p4 withObject:(id)p5 withObject:(id)p6;
-(id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3
          withObject:(id)p4 withObject:(id)p5 withObject:(id)p6 withObject:(id)p7;


@end
