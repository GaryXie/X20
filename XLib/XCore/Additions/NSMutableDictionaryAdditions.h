//
//  NSMutableDictionaryAdditions.h
//  X20
//
//  Created by Gary Xie on 11/26/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (XCategory)

// Adds a string on the conditions that it's non-nil and non-empty
- (void)setNonEmptyString:(NSString *)string forKey:(id)key;

@end
