//
//  SecondViewController.m
//  Canary
//
//  Created by Chris Foo on 12/26/13.
//  Copyright (c) 2013 Chris Foo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize books;
@synthesize titles;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (IBAction)clickDone:(id)sender {
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@">>>> Books count is %d", [books count]);
    return [books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    NSLog(@"Accessing row %d", indexPath.row);
    
    /*
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    */
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = titles[indexPath.row];
    cell.detailTextLabel.text = [books authorOfTitle:titles[indexPath.row]];
    
    NSLog(@"Title: %@  Author: %@", titles[indexPath.row], [books authorOfTitle:titles[indexPath.row]]);
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Famous Books";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
