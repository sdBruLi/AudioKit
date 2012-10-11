//
//  OscillatorInstrument.m
//  OCSiPad
//
//  Created by Aurelius Prochazka on 8/30/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OscillatorInstrument.h"

#import "OCSSineTable.h"
#import "OCSOscillator.h"
#import "OCSAudio.h"

@implementation OscillatorInstrument 

@synthesize frequency = freq;
@synthesize amplitude = amp;

- (id)init {
    self = [super init];
    if (self) {
        
        // INPUTS AND CONTROLS =================================================
        
        freq = [[OCSInstrumentProperty alloc] initWithValue:kFrequencyInit
                                                   minValue:kFrequencyMin
                                                   maxValue:kFrequencyMax];
        [self addProperty:freq];
        
        amp = [[OCSInstrumentProperty alloc] initWithValue:kAmplitudeInit
                                                  minValue:kAmplitudeMin
                                                  maxValue:kAmplitudeMax];
        [self addProperty:amp];
        
        // INSTRUMENT DEFINITION ===============================================
        
        OCSParameterArray *partialStrengthParamArray =
        [OCSParameterArray paramArrayFromParams: ocsp(1),ocsp(0.5), ocsp(1), nil];
        
        OCSSineTable *sine;
        sine = [[OCSSineTable alloc] initWithSize:4096
                                 partialStrengths:partialStrengthParamArray];
        [self addFTable:sine];
        
        OCSOscillator *myOscil;
        myOscil = [[OCSOscillator alloc] initWithFTable:sine
                                              frequency:freq
                                              amplitude:amp];
        [self connect:myOscil];
        

        
        // AUDIO OUTPUT ========================================================
        
        OCSAudio *audio;
        audio = [[OCSAudio alloc] initWithMonoInput:myOscil];
        [self connect:audio];
    }
    return self;
}


@end