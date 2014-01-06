//
//  Books.m
//  Canary
//
//  Created by Chris Foo on 12/26/13.
//  Copyright (c) 2013 Chris Foo. All rights reserved.
//

#import "Books.h"

@implementation Books {
    NSDictionary *books;
}

@synthesize titles;
@synthesize count;

- (id)init
{
    self = [super init];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"books" withExtension:@"plist"];
    
    books = [NSDictionary dictionaryWithContentsOfURL:url];
    titles = books.allKeys;
    count = [titles count];
    
    return self;
}

-(NSString *) authorOfTitle:(NSString *)title {
    NSString *author;
    
    author = [books objectForKey:title];
    
    return author;
}

@end
