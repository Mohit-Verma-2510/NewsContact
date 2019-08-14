//
//  SampleViewController.m
//  ThirdAssignment
//
//  Created by Mohit Verma on 23/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

#import "SampleViewController.h"
#import "ThirdAssignment-Swift.h"

@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)printSomeData {
    NSLog(@"This is called from SWIFT...");
    
    ///Calling swift function from objective c
    NewsFeedViewController *obj = [[NewsFeedViewController alloc]init];
    [obj sampleFuncForObjc];
}

@end
