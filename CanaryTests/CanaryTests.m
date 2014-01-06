//
//  CanaryTests.m
//  CanaryTests
//
//  Created by Chris Foo on 12/24/13.
//  Copyright (c) 2013 Chris Foo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Books.h"

@interface CanaryTests : XCTestCase

@end

@implementation CanaryTests {
    Books *myBooks;
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    myBooks = [[Books alloc] init];
    
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTitles
{
    if ([[myBooks titles] count] <= 0) {
        XCTFail(@"No titles were loaded \"%s\"", __PRETTY_FUNCTION__);
    } else {
        NSArray *titles = [myBooks titles];
        int numTitles = [titles count];
        
        for (int i = 0; i < numTitles; i++) {
            NSLog(@"Title %d is %@", i, titles[i]);
        }
    }
}

- (void)testAuthorOfTitle
{
    NSArray *allTitles = [myBooks titles];
    NSString *title = allTitles[3];
    
    NSString *author = [myBooks authorOfTitle:title];
    
    if ((author == nil) || ([author length] == 0)) {
        XCTFail(@"Books object not initialized correctly \"%s\"", __PRETTY_FUNCTION__);
        
    } else {
        NSLog(@"Author of Title %@ is %@", title, author);
    }
}

- (void)testCount
{
    NSArray *t = [myBooks titles];
    if ([myBooks count] != [t count]) {
        XCTFail(@"Count is not correct \"%s\"", __PRETTY_FUNCTION__);
    }
}

@end
