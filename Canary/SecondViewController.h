//
//  SecondViewController.h
//  Canary
//
//  Created by Chris Foo on 12/26/13.
//  Copyright (c) 2013 Chris Foo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Books.h"

@interface SecondViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) Books *books;
@property (nonatomic) NSArray *titles;

@end
