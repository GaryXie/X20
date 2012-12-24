//
//  XMarkupStripper.h
//  X20
//
//  Created by Gary Xie on 12/20/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

#if ____IPHONE_4_0 && __IPHONE_4_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
@interface XMarkupStripper : NSObject <NSXMLParserDelegate>{
#else
    @interface XMarkupStripper : NSObject{
#endif
    @private
        NSMutableArray* _strings;
    }

// Strips markup from the given string and returns the result
    -(NSString*)parse:(NSString*)string;

@end

