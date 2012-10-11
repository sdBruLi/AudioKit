//
//  OCSTableValue.h
//  Objective-C Sound
//
//  Created by Aurelius Prochazka on 7/2/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OCSParameter+Operation.h"

/**
 Accesses table values by direct indexing with linear interpolation.
 */
@interface OCSTableValue : OCSParameter

/// Initialize the opcode as an audio operation.
/// @param                fTable Function table read the data from.
/// @param audioRateIndex Indexing Parameter.
- (id)initWithFTable:(OCSConstant *)fTable
    atAudioRateIndex:(OCSParameter *)audioRateIndex;

/// Initialize the opcode as a control.
/// @param                  fTable Function table read the data from.
/// @param controlRateIndex Indexing Parameter.
- (id)initWithFTable:(OCSConstant *)fTable
  atControlRateIndex:(OCSControl *)controlRateIndex;

/// Initialize the opcode as a a constant.
/// @param               fTable Function table read the data from.
/// @param constantIndex Indexing Parameter.
- (id)initWithFTable:(OCSConstant *)fTable
     atConstantIndex:(OCSConstant *)constantIndex;


/// Optional instruction to normalize the data.
@property (nonatomic, assign) BOOL normalizeResult;
/// Optional value by which index is to be offset. For a table with origin at center, use tablesize/2 (raw) or .5 (normalized). The default value is 0.
@property (nonatomic, strong) OCSParameter *offset;
/// Optional instruction to wrap the data.  Without wrapping, (index < 0 treated as index=0; index > tablesize sticks at index=size)
@property (nonatomic, assign) BOOL wrapData;


@end