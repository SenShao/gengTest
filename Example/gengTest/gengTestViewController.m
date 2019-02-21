//
//  gengTestViewController.m
//  gengTest
//
//  Created by Gengsensen123 on 12/20/2018.
//  Copyright (c) 2018 Gengsensen123. All rights reserved.
//

#import "gengTestViewController.h"
#import "GNTestViewController.h"
#import <CTMediator/CTMediator.h>
#import "CTMediator+gengTest.h"
@interface gengTestViewController ()

@end

@implementation gengTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    GNTestViewController * vc = [[CTMediator sharedInstance]GNTestViewController];
    
    if (vc) {
        
        [self presentViewController:vc animated:YES completion:nil];

    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
