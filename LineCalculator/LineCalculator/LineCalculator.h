//
//  LineCalculator.h
//  LineCalculator
//
//  Created by Алексей on 19.04.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LineCalculator : NSObject
{
    // Array, that represents the components of the math expression
    // like 4 * 2 + 3 --> [4, "*", 2, "+", 3]
    
    // The first component is the initializing value
    NSMutableArray *_mathExpression;
    
}

+(LineCalculator*)defaultValue: (NSNumber*) num;

-(LineCalculator*)initWithNumber: (NSNumber*) num;

-(LineCalculator*) add: (NSNumber*) num;
-(LineCalculator*) subtract: (NSNumber*) num;
-(LineCalculator*) multiply: (NSNumber*) num;
-(LineCalculator*) devide: (NSNumber*) num;
-(LineCalculator*) pow: (NSNumber*) num;

-(NSString *)description;

@end
