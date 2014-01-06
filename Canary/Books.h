//
//  Books.h
//  Canary
//
//  Created by Chris Foo on 12/26/13.
//  Copyright (c) 2013 Chris Foo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Books : NSObject

@property (nonatomic) NSArray *titles;
@property (nonatomic) int count;

-(NSString *) authorOfTitle: (NSString*) title;

@end
