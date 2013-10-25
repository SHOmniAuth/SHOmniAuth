//
//  SHViewController.m
//  SHOmniAuthExample
//
//  Created by Seivan Heidari on 3/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import "SHViewController.h"
#import "SHOmniAuthTwitter.h"

@interface SHOmniAuthTwitter ()
@end

@interface SHViewController ()

@end

@implementation SHViewController

-(void)viewDidAppear:(BOOL)animated; {
    [super viewDidAppear:animated];
  
    [SHOmniAuthTwitter performLoginWithListOfAccounts:^(NSArray *accounts, SHOmniAuthAccountPickerHandler pickAccountBlock) {
      pickAccountBlock(accounts.lastObject);
    } onComplete:^(id<account> account, id response, NSError *error, BOOL isSuccess) {
      NSLog(@"%@ - %@ -%@ - %d", account, response, error, isSuccess);
    }];
  
  
}

@end