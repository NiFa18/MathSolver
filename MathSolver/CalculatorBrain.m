//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Niedermann Fabian on 06.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
#include "math.h"

@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;

@end

@implementation CalculatorBrain

-(NSMutableArray *)operandStack
{
    if (_operandStack == nil) 
    {
        _operandStack = [[NSMutableArray alloc] init];
    }
        return _operandStack;
}

-(void)pushOperand:(double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];    
}

-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *)operation
{
    double result = 0;
    if ([operation isEqualToString:@"+"]) {
        double operand = [self popOperand];
        result = [self popOperand] + operand;
    } else if ([operation isEqualToString:@"-"]) {
        double operand = [self popOperand];
        result = [self popOperand] - operand;
    } else if ([operation isEqualToString:@"*"]) {
        double operand = [self popOperand];
        result = [self popOperand] * operand;
    } else if ([operation isEqualToString:@"/"]) {
        double operand = [self popOperand];
        result = [self popOperand] / operand;
    } else if ([operation isEqualToString:@"sqrt"]) {
        result = sqrt([self popOperand]);
    }
    [self pushOperand:result];
    return result;
}

@end
