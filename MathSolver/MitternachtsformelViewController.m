//
//  MitternachtsformelViewController.m
//  Mitternachtsformel
//
//  Created by Niedermann Fabian on 06.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MitternachtsformelViewController.h"
#include "math.h"

@interface MitternachtsformelViewController ()

@end

@implementation MitternachtsformelViewController

- (IBAction)solveClear:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
    self.fieldA.enabled = !self.fieldA.isEnabled;
    self.fieldB.enabled = !self.fieldB.isEnabled;
    self.fieldC.enabled = !self.fieldC.isEnabled;
    

    if (!sender.isSelected) {
        self.labelRes1.text = [NSString stringWithFormat:@""];
        self.labelRes2.text = [NSString stringWithFormat:@""];
        self.fieldA.text = [NSString stringWithFormat:@""];
        self.fieldB.text = [NSString stringWithFormat:@""];
        self.fieldC.text = [NSString stringWithFormat:@""];
        
    } else {
        double a = [self.fieldA.text doubleValue];
        double b = [self.fieldB.text doubleValue];
        double c = [self.fieldC.text doubleValue];
        double res1;
        double res2;
        if (b*b-4*a*c < 0) {
            res1 = sqrt(fabs(b*b-4*a*c))/(2*a);     //imaginary result (+-)
            res2 = (-1*b)/(2*a);                 //real result
            self.labelRes1.text = [NSString stringWithFormat:@"%g + j %g",res2, res1];
            self.labelRes2.text = [NSString stringWithFormat:@"%g - j %g",res2, res1];
        } else {
            res1 = (-1*b+sqrt(b*b-4*a*c))/(2*a);
            res2 = (-1*b-sqrt(b*b-4*a*c))/(2*a);
            self.labelRes1.text = [NSString stringWithFormat:@"%g", res1];
            self.labelRes2.text = [NSString stringWithFormat:@"%g", res2];
        }

    }
}
@end
