//
//  OCSLine.m
//  Objective-C Sound
//
//  Created by Adam Boulanger on 6/7/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OCSLine.h"

@interface OCSLine () {
    OCSParameter *output;
    
    OCSConstant *ia;
    OCSConstant *ib;
    OCSConstant *idur;
}
@end

@implementation OCSLine

- (id)initFromValue:(OCSConstant *)startingValue
            toValue:(OCSConstant *)endingValue
           duration:(OCSConstant *)duration
{
    self = [super init];

    if (self) {
        output = [OCSParameter parameterWithString:[self operationName]];
        
        ia = startingValue;
        ib = endingValue;
        idur = duration;
    }
    return self; 
}

//Csound Prototype: (a/k)res linseg ia, idur, ib
- (NSString *)stringForCSD 
{
    return [NSString stringWithFormat:@"%@ linseg %@, %@, %@", output, ia, idur, ib];
}

- (NSString *)description {
    return [output parameterString];
}

@end