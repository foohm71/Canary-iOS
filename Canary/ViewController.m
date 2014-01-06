//
//  ViewController.m
//  Canary
//
//  Created by Chris Foo on 12/24/13.
//  Copyright (c) 2013 Chris Foo. All rights reserved.
//

#import "ViewController.h"
#import "Books.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *simpleTextField;

@property (weak, nonatomic) IBOutlet UILabel *simpleLabel;

@end

@implementation ViewController {
    Books *books;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"ViewDidLoad");
	// Do any additional setup after loading the view, typically from a nib.
    books = [[Books alloc] init];
    self.title = @"Canary";
}

- (IBAction)clickModifyText:(id)sender {
    NSString *textContents = [[self simpleTextField] text];

    if ([textContents rangeOfString:@"idiot"].location == NSNotFound) {
        [[self simpleLabel] setText:textContents];
        [[self simpleTextField] resignFirstResponder];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Actung!" message:@"Please be more civil!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
        
}

// This is to basically say that once you touch on other parts of the canvas, to end all editing ie. keep the keyboard
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}

// This is to use the ViewController as a delegate to the UITextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

// This is to pass the data object over to new scene
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    SecondViewController *second = [segue destinationViewController];
    
    if ([second books] == nil) {
        [second setBooks:books];
        [second setTitles:[books titles]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

