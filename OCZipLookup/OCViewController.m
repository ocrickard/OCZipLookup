//
//  OCViewController.m
//  OCZipLookup
//
//  Created by Oliver Rickard on 4/18/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "OCViewController.h"
#import "OCZipLookupController.h"

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDate *startTime = [NSDate date];
    
    NSDictionary *results = [OCZipLookupController lookupZipCode:95521];
    
    NSLog(@"%@", results.description);
    
    NSLog(@"Time Since Beginning:%f", -[startTime timeIntervalSinceNow]);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
