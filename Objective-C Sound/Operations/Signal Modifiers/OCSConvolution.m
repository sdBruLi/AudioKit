//
//  OCSConvolution.m
//  Objective-C Sound
//
//  Created by Aurelius Prochazka on 6/27/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OCSConvolution.h"

@interface OCSConvolution () {
    OCSParameter *aR1;
    OCSParameter *aIn;
    NSString *iFilCod;
}
@end

@implementation OCSConvolution

- (id)initWithInputAudio:(OCSParameter *)inputAudio 
     impulseResponseFile:(NSString *)impulseResponseFilename;
{
    self = [super init];
    if (self) {
        aR1     =  [OCSParameter parameterWithString:[self operationName]];
        aIn     = inputAudio;
        iFilCod = impulseResponseFilename;
    }
    return self; 
}

// Csound prototype: ar1 [, ar2] [, ar3] [, ar4] pconvolve ain, ifilcod [, ipartitionsize, ichannel]
- (NSString *)stringForCSD
{
    return [NSString stringWithFormat:
            @"%@ pconvolve %@, \"%@\"",
            aR1, aIn, iFilCod];
}

- (NSString *)description {
    return [aR1 parameterString];
}

@end