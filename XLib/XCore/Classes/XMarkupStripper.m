//
//  XMarkupStripper.m
//  X20
//
//  Created by Gary Xie on 12/20/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

#import "XMarkupStripper.h"

#import "XCorePreprocessorMacros.h"
#import "XEntityTables.h"

@implementation XMarkupStripper

/////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc
{
    X_RELEASE_SAFELY(_strings);
    [super dealloc];
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSXMLParserDelegate

/////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)parser:(NSXMLParser*)parser foundCharacters:(NSString *)string
{
    [_strings addObject:string];
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSData*)parser: (NSXMLParser*)parser
    resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID
{
    return [[[XEntityTables sharedInstance] iso88591] objectForKey:name];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public

-(NSString*)parse:(NSString *)string
{
    _strings = [[NSMutableArray alloc] init];
    
    NSString* document = [NSString stringWithFormat:@"<x>%@</x>", string];
    NSData* data = [document dataUsingEncoding:string.fastestEncoding];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
    X_RELEASE_SAFELY(parser);
    
    NSString* result = [_strings componentsJoinedByString:@""];
    X_RELEASE_SAFELY(_strings);
    
    return result;
    
}






@end
