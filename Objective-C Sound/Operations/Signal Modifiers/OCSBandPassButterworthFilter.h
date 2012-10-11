//
//  OCSBandPassButterworthFilter.h
//  OCS iPad Examples
//
//  Created by Adam Boulanger on 9/12/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OCSParameter+Operation.h"

/** A second-order band-pass Butterworth filter. These filters are Butterworth second-order IIR filters.
 They are slightly slower than the original filters in Csound, but they offer an almost flat
 passband and very good precision and stopband attenuation.
 */

@interface OCSBandPassButterworthFilter : OCSParameter

/// @name Properties

/// @name Initialization

/// Creates a band-pass Butterworth filter.
/// @param inputSignal     The input to be filtered.
/// @param centerFrequency Center frequency for each of the filters.
/// @param bandwidthRange  Bandwidth of the bandpass filter.
-(id)initWithInput:(OCSParameter *)inputSignal
   centerFrequency:(OCSControl *)centerFrequency
         bandwidth:(OCSControl *)bandwidthRange;

@end