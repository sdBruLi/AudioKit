//
//  OCSPluckString.h
//  Objective-C Sound
//
//  Created by Aurelius Prochazka on 6/25/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OCSParameter+Operation.h"

/** Produces a naturally decaying string sound based on the Karplus-Strong algorithms.

 An internal audio buffer,, is continually resampled at the Resampling Frequency and 
 the resulting output is multiplied by the amplitude. Parallel with the sampling, the 
 buffer is smoothed to simulate the effect of natural decay.

 */

@interface OCSPluckString : OCSParameter

/// @name Properties

/// @name Initialization

/// Initializes the string with simple averaging smoothing process.
/// @param amplitude           The output amplitude.
/// @param resamplingFrequency The resampling frequency in cycles-per-second.
/// @param pitchDecayFrequency Intended pitch value in Hz, used to set up a buffer of 1 cycle of audio samples which will be smoothed over time by a chosen decay method.  Normally anticipates the resampling frequency, but may be set artificially high or low to influence the size of the sample buffer.
/// @param audioBuffer        The output of a function table used to initialize the cyclic decay buffer. If set to zero, a random sequence will be used instead.
- (id) initWithSimpleAveragingDecayAndAmplitude:(OCSControl *)amplitude
                            resamplingFrequency:(OCSControl *)resamplingFrequency
                            pitchDecayFrequency:(OCSConstant *)pitchDecayFrequency
                                    audioBuffer:(OCSConstant *)audioBuffer;

/// Initializes the string with a stretched averaging.
/// @param amplitude           The output amplitude.
/// @param resamplingFrequency The resampling frequency in cycles-per-second.
/// @param pitchDecayFrequency Intended pitch value in Hz, used to set up a buffer of 1 cycle of audio samples which will be smoothed over time by a chosen decay method.  Normally anticipates the resampling frequency, but may be set artificially high or low to influence the size of the sample buffer.
/// @param audioBuffer        The output of a function table used to initialize the cyclic decay buffer. If set to zero, a random sequence will be used instead.
/// @param stretchFactor     Must be greater than or equal to 1.
- (id) initWithStretchedAveragingDecayAndAmplitude:(OCSControl *)amplitude
                               resamplingFrequency:(OCSControl *)resamplingFrequency
                               pitchDecayFrequency:(OCSConstant *)pitchDecayFrequency
                                       audioBuffer:(OCSConstant *)audioBuffer
                                     stretchFactor:(OCSConstant *)stretchFactor;

/// Initializes the string with weighted averaging.
/// @param amplitude           The output amplitude.
/// @param resamplingFrequency The resampling frequency in cycles-per-second.
/// @param pitchDecayFrequency Intended pitch value in Hz, used to set up a buffer of 1 cycle of audio samples which will be smoothed over time by a chosen decay method.  Normally anticipates the resampling frequency, but may be set artificially high or low to influence the size of the sample buffer.
/// @param audioBuffer        The output of a function table used to initialize the cyclic decay buffer. If set to zero, a random sequence will be used instead.
/// @param currentWeight      Weighting the current sample (the status quo).
/// @param previousWeight     Weighting the previous sample.  Sum of current and previous wiehgt must less than or equal to 1.
- (id) initWithWeightedAveragingDecayAndAmplitude:(OCSControl *)amplitude
                              resamplingFrequency:(OCSControl *)resamplingFrequency
                              pitchDecayFrequency:(OCSConstant *)pitchDecayFrequency
                                      audioBuffer:(OCSConstant *)audioBuffer
                                    currentWeight:(OCSConstant *)currentWeight
                                   previousWeight:(OCSConstant *)previousWeight;

/// Initializes the string with first order recursive filter with coefficients of 0.5.
/// @param amplitude           The output amplitude.
/// @param resamplingFrequency The resampling frequency in cycles-per-second.
/// @param pitchDecayFrequency Intended pitch value in Hz, used to set up a buffer of 1 cycle of audio samples which will be smoothed over time by a chosen decay method.  Normally anticipates the resampling frequency, but may be set artificially high or low to influence the size of the sample buffer.
/// @param audioBuffer        The output of a function table used to initialize the cyclic decay buffer. If set to zero, a random sequence will be used instead.
- (id) initWithRecursiveFilterDecayAndAmplitude:(OCSControl *)amplitude
                            resamplingFrequency:(OCSControl *)resamplingFrequency
                            pitchDecayFrequency:(OCSConstant *)pitchDecayFrequency
                                    audioBuffer:(OCSConstant *)audioBuffer;

;@end