//
//  Complex.m
//  complex
//
//  Created by Niedermann Fabian on 25.02.13.
//  Copyright (c) 2013 Niedermann Fabian. All rights reserved.
//

#import "Complex.h"

@interface Complex ()

@end

@implementation Complex

-(id)initWithComplexReal:(double)preal andImag:(double)pimag {
    self = [super init];
    if (self) {
        _real = [NSNumber numberWithDouble:preal];
        _imag = [NSNumber numberWithDouble:pimag];
    }
    return self;
}

-(id)initWithComplexValue:(double)val andAngleRad:(double)ang {
    self = [super init];
    if (self) {
        _real = [NSNumber numberWithDouble:(val*cos(ang))];
        _imag = [NSNumber numberWithDouble:(val*sin(ang))];
    }
    return self;
}

-(id)initWithComplexValue:(double)val andAngleDeg:(double)ang {
    self = [super init];
    if (self) {
        _real = [NSNumber numberWithDouble:(val*cos(ang/360*2*M_PI))];
        _imag = [NSNumber numberWithDouble:(val*sin(ang/360*2*M_PI))];
    }
    return self;
}


-(Complex *)add:(Complex *)compl {
    self.real = [NSNumber numberWithDouble:([self.real doubleValue] + [compl.real doubleValue])];
    self.imag = [NSNumber numberWithDouble:([self.imag doubleValue] + [compl.imag doubleValue])];
    return self;
}

-(Complex *)sub:(Complex *)compl {
    self.real = [NSNumber numberWithDouble:([self.real doubleValue] - [compl.real doubleValue])];
    self.imag = [NSNumber numberWithDouble:([self.imag doubleValue] - [compl.imag doubleValue])];
    return self;
}

-(Complex *)mult:(Complex *)compl {
    Complex *tmp = [[Complex alloc] init];
    tmp.real = [NSNumber numberWithDouble:([self.real doubleValue]*[compl.real doubleValue]-[self.imag doubleValue]*[compl.imag doubleValue])];
    tmp.imag = [NSNumber numberWithDouble:([self.real doubleValue]*[compl.imag doubleValue]+[self.imag doubleValue]*[compl.real doubleValue])];
    self.real = tmp.real;
    self.imag = tmp.imag;
    return self;
}

-(Complex *)div:(Complex *)compl {
    Complex *tmp = [[Complex alloc] init];
    tmp.real = [NSNumber numberWithDouble:(([self.real doubleValue]*[compl.real doubleValue]+[self.imag doubleValue]*[compl.imag doubleValue])/(powf([compl.real doubleValue], 2.0)+powf([compl.imag doubleValue], 2.0)))];
    tmp.imag = [NSNumber numberWithDouble:(([self.imag doubleValue]*[compl.real doubleValue]-[self.real doubleValue]*[compl.imag doubleValue])/(powf([compl.real doubleValue], 2.0)+powf([compl.imag doubleValue], 2.0)))];
    self.real = tmp.real;
    self.imag = tmp.imag;
    return self;    
}

-(Complex *)conj {
    self.imag = [NSNumber numberWithDouble:-1.0*([self.imag doubleValue])];
    return self;
}

-(Complex *)inv {
    Complex *one = [[Complex alloc] initWithComplexReal:1 andImag:0];
    [one div:self];
    self.real = one.real;
    self.imag = one.imag;
    return self;
}

-(NSNumber *)abs {
    return [NSNumber numberWithDouble:sqrtf(pow([self.real doubleValue], 2.0)+pow([self.imag doubleValue], 2.0))];
}

-(NSNumber *)ang {
    return [NSNumber numberWithDouble:atan([self.imag doubleValue]/[self.real doubleValue])];
}

-(void)printRect {
    if ([self.imag doubleValue] < 0.0) {
        NSLog(@"%lg%lg⋅j", [self.real doubleValue], [self.imag doubleValue]);
    } else {
        NSLog(@"%lg+%lg⋅j", [self.real doubleValue], [self.imag doubleValue]);
    }    
}

-(void)printPolarDeg {
    NSLog(@"%lg ∠ %lg", [self.abs doubleValue], [self.ang doubleValue]/(2*M_PI)*360);
}

-(void)printPolarRad {
    NSLog(@"%lg⋅e^(%lg⋅j)", [self.abs doubleValue], [self.ang doubleValue]);
}

-(NSString *)complexAsStringRect {
    NSString *s1 = [[NSString alloc] init];
    if ([self.imag doubleValue] < 0.0) {
        s1 = [NSString stringWithFormat:@"%lg%lg⋅j", [self.real doubleValue], [self.imag doubleValue]];
    } else {
        s1 = [NSString stringWithFormat:@"%lg+%lg⋅j", [self.real doubleValue], [self.imag doubleValue]];
    }
    return s1;
}

-(NSString *)complexAsStringPolarDeg {
    NSString *s1 = [[NSString alloc] initWithFormat:@"%lg ∠ %lg",[self.abs doubleValue], ([self.ang doubleValue]*360/(2*M_PI))];
    return s1;
}

-(NSString *)complexAsStringPolarRad {
    NSString *s1 = [[NSString alloc] initWithFormat:@"%lg⋅e^(%lg⋅j)",[self.abs doubleValue], [self.ang doubleValue]];
    return s1;
}

@end