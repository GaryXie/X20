//
//  X20UnitTest.m
//  X20UnitTest
//
//  Created by Gary.Xie on 10/27/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "X20UnitTest.h"

@implementation X20UnitTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    STFail(@"Unit tests are not implemented yet in X20UnitTest");
}

-(void)testXCurrentLocale
{
    NSArray* languages = [NSLocale preferredLanguages];
}

@end
