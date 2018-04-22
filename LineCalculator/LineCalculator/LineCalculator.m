//
//  LineCalculator.m
//  LineCalculator
//
//  Created by Алексей on 19.04.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "LineCalculator.h"

@implementation LineCalculator

+ (LineCalculator *)defaultValue:(NSNumber *)num {
    LineCalculator *newInstance = [[LineCalculator alloc] initWithNumber:num];
    return [newInstance autorelease];
}

- (LineCalculator *)add:(NSNumber *)num {
    [_mathExpression addObject:@"+"];
    [_mathExpression addObject:num];
    return self;
}

- (LineCalculator *)subtract:(NSNumber *)num {
    [_mathExpression addObject:@"-"];
    [_mathExpression addObject:num];
    return self;
}

- (LineCalculator *)multiply:(NSNumber *)num {
    [_mathExpression addObject:@"*"];
    [_mathExpression addObject:num];
    return self;
}

- (LineCalculator *)devide:(NSNumber *)num {
    [_mathExpression addObject:@"/"];
    [_mathExpression addObject:num];
    return self;
}

- (LineCalculator *)pow:(NSNumber *)num {
    [_mathExpression addObject:@"^"];
    [_mathExpression addObject:num];
    return self;
}

- (void)calculateOperation: (NSString *) operation withBlock: (NSNumber* (^)(NSNumber *leftOperand, NSNumber* rightOperand)) operationBlock {
    NSUInteger index = [_mathExpression indexOfObject:operation];
    
    NSNumber *leftOperand = [_mathExpression objectAtIndex:(index - 1)];
    NSNumber *rightOperand = [_mathExpression objectAtIndex:(index + 1)];
    
    NSNumber *result = operationBlock(leftOperand, rightOperand);
    
    // Replace operation in the expression with the result of this operation
    [_mathExpression replaceObjectAtIndex:(index - 1) withObject:result];
    
    [_mathExpression removeObjectAtIndex:(index + 1)];
    [_mathExpression removeObjectAtIndex:index];
}

- (void)calculateExpression {
    
    NSArray *operationsOrder = @[@"^", @"/", @"*", @"-", @"+"];
    
    NSDictionary *operationsBlocks = @{@"^": ^NSNumber *(NSNumber *leftOperand, NSNumber *rightOperand) {
                                         return [NSNumber numberWithDouble: pow([leftOperand doubleValue], [rightOperand doubleValue])];
                                     },
                                     @"/": ^NSNumber *(NSNumber *leftOperand, NSNumber *rightOperand) {
                                         return [NSNumber numberWithDouble:[leftOperand doubleValue] / [rightOperand doubleValue]];
                                     },
                                     @"*": ^NSNumber *(NSNumber *leftOperand, NSNumber *rightOperand) {
                                         return [NSNumber numberWithDouble:[leftOperand doubleValue] * [rightOperand doubleValue]];
                                     },
                                     @"-": ^NSNumber *(NSNumber *leftOperand, NSNumber *rightOperand) {
                                         return [NSNumber numberWithDouble:[leftOperand doubleValue] - [rightOperand doubleValue]];
                                     },
                                     @"+": ^NSNumber *(NSNumber *leftOperand, NSNumber *rightOperand) {
                                         return [NSNumber numberWithDouble:[leftOperand doubleValue] + [rightOperand doubleValue]];
                                     }
                                    };
    
    for (NSString *operation in operationsOrder) {
        while ([_mathExpression containsObject:operation]) {
            [self calculateOperation:operation withBlock:operationsBlocks[operation]];
        }
    }
    
}

-(NSString *)description {
    [self calculateExpression];
    return [NSString stringWithFormat:@"%@", _mathExpression[0]];
}

- (LineCalculator *)initWithNumber:(NSNumber *)num
{
    self = [super init];
    if (self) {
        _mathExpression = [[NSMutableArray alloc] init];
        [_mathExpression addObject:num];
    }
    return self;
}

- (void)dealloc {
    [_mathExpression release];
    [super dealloc];
}

@end
