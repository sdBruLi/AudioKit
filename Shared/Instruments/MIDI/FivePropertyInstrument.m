//
//  FivePropertyInstrument.m
//  OCS iPad Examples
//
//  Created by Aurelius Prochazka on 8/13/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//


#import "FivePropertyInstrument.h"
#import "OCSSineTable.h"
#import "OCSProduct.h"
#import "OCSFMOscillator.h"
#import "OCSLowPassButterworthFilter.h"
#import "OCSAudio.h"

@implementation FivePropertyInstrument

@synthesize pitchBend, modulation, cutoffFrequency;

- (FivePropertyInstrumentNote *)createNote {
    return [[FivePropertyInstrumentNote alloc] initWithInstrument:self];
}

-(id)init
{
    self = [super init];
    if ( self) {
        
        // NOTE BASED CONTROL ==================================================
        FivePropertyInstrumentNote *note = [self createNote];
        [self addNoteProperty:note.volume];
        [self addNoteProperty:note.frequency];
        
        
        // INPUTS AND CONTROLS =================================================
        pitchBend = [[OCSInstrumentProperty alloc] initWithValue:1
                                                        minValue:kPitchBendMin
                                                        maxValue:kPitchBendMax];
        modulation = [[OCSInstrumentProperty alloc] initWithMinValue:kModulationMin
                                                            maxValue:kModulationMax];
        cutoffFrequency = [[OCSInstrumentProperty alloc] initWithMinValue:kLpCutoffMin
                                                                 maxValue:kLpCutoffMax];
        
        [self addProperty:pitchBend];
        [self addProperty:modulation];
        [self addProperty:cutoffFrequency];
        
        // INSTRUMENT DEFINITION ===============================================
        
        OCSSineTable *sine = [[OCSSineTable alloc] init];
        [self addFTable:sine];
        
        OCSControl *bentFreq;
        bentFreq = [[OCSControl alloc] initWithExpression:[NSString stringWithFormat:@"%@  * %@", note.frequency, pitchBend]];
        
        OCSFMOscillator *fm = [[OCSFMOscillator alloc] initWithFTable:sine
                                                        baseFrequency:bentFreq
                                                    carrierMultiplier:ocsp(2)
                                                 modulatingMultiplier:modulation
                                                      modulationIndex:ocsp(15)
                                                            amplitude:note.volume];
        [self connect:fm];
        
        OCSLowPassButterworthFilter *lpFilter;
        lpFilter = [[OCSLowPassButterworthFilter alloc] initWithInput:fm
                                                      cutoffFrequency:cutoffFrequency];
        [self connect:lpFilter];
        
        // AUDIO OUTPUT ========================================================
        
        OCSAudio *audio = [[OCSAudio alloc] initWithMonoInput:lpFilter];
        [self connect:audio];
    }
    return self;
}

@end


@implementation FivePropertyInstrumentNote

@synthesize volume;
@synthesize frequency;

- (id)initWithInstrument:(OCSInstrument *)anInstrument {
    self = [super initWithInstrument:anInstrument];
    if (self) {

        volume = [[OCSNoteProperty alloc] initWithValue:kVolumeInit
                                               minValue:kVolumeMin
                                               maxValue:kVolumeMax];
        [self addProperty:volume];
        
        frequency = [[OCSNoteProperty alloc] initWithValue:kFrequencyMin
                                                  minValue:kFrequencyMin
                                                  maxValue:kFrequencyMax];
        [self addProperty:frequency];

    }
    return self;
}


@end