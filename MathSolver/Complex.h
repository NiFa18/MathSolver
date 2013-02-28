//
//  Complex.h
//  complex
//
//  Created by Niedermann Fabian on 25.02.13.
//  Copyright (c) 2013 Niedermann Fabian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Complex : NSNumber

@property (strong, nonatomic) NSNumber *real;
@property (strong, nonatomic) NSNumber *imag;
-(id)initWithComplexReal:(double)preal andImag:(double)pimag;
-(id)initWithComplexValue:(double)val andAngleRad:(double)ang;
-(id)initWithComplexValue:(double)val andAngleDeg:(double)ang;
-(Complex *)add:(Complex *)compl;
-(Complex *)sub:(Complex *)compl;
-(Complex *)mult:(Complex *)compl;
-(Complex *)div:(Complex *)compl;
-(Complex *)conj;
-(Complex *)inv;
-(void)printRect;
-(void)printPolarDeg;
-(void)printPolarRad;
-(NSNumber *)abs;
-(NSNumber *)ang;
-(NSString *)complexAsStringRect;
-(NSString *)complexAsStringPolarDeg;
-(NSString *)complexAsStringPolarRad;


@end
