//
//  CTMediator+gengTest.m
//  CTMediator
//
//  Created by 耿森森 on 2019/2/21.
//

#import "CTMediator+gengTest.h"

@implementation CTMediator (gengTest)


- (UIViewController *)GNTestViewController
{
    
    return [self performTarget:@"GNTestViewController" action:@"GNTestViewController" params:nil shouldCacheTarget:NO];
    
}

@end
