//
//  CanaryOCUnitTests.m
//  CanaryOCUnitTests
//
//  Created by Chris Foo on 1/17/14.
//  Copyright (c) 2014 Chris Foo. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Books.h"

@interface CanaryOCUnitTests : SenTestCase

@end

@implementation CanaryOCUnitTests {
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
        STFail(@"No titles were loaded \"%s\"", __PRETTY_FUNCTION__);
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
        STFail(@"Books object not initialized correctly \"%s\"", __PRETTY_FUNCTION__);
        
    } else {
        NSLog(@"Author of Title %@ is %@", title, author);
    }
}

- (void)testCount
{
    NSArray *t = [myBooks titles];
    if ([myBooks count] != [t count]) {
        STFail(@"Count is not correct \"%s\"", __PRETTY_FUNCTION__);
    }
}


@end
