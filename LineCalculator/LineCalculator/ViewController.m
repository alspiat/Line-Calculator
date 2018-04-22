//
//  ViewController.m
//  LineCalculator
//
//  Created by Алексей on 19.04.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "ViewController.h"
#import "LineCalculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @autoreleasepool {
        LineCalculator *calc = [LineCalculator defaultValue:@2];
        NSLog(@"%@", [[calc add:@2] multiply:@2]); // 6

        calc = [LineCalculator defaultValue:@10];
        NSLog(@"%@", [calc add:@83]); // 93

        calc = [LineCalculator defaultValue:@4];
        NSLog(@"%@", [[[[[[[[[calc pow:@1] pow:@1] pow:@1] multiply:@2] add:@80] subtract:@11] multiply:@1] subtract:@41] subtract:@65]); // -29

        calc = [LineCalculator defaultValue:@6];
        NSLog(@"%@", [[[[[[[calc add:@14] subtract:@16] add:@36] multiply:@1] subtract:@46] add:@57] pow:@1]); // 51

        calc = [LineCalculator defaultValue:@10];
        NSLog(@"%@", [[calc pow:@1] pow:@1]); // 10

        calc = [LineCalculator defaultValue:@7];
        NSLog(@"%@", [[[[[[[[calc subtract:@94] subtract:@97] multiply:@1] pow:@1] multiply:@1] pow:@1] subtract:@65] pow:@1]); // -249

        calc = [LineCalculator defaultValue:@7];
        NSLog(@"%@", [[[[[[calc subtract:@43] subtract:@43] multiply:@1] subtract:@60] add:@8] subtract:@28]); // -159
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
