//
//  DecimalUtils.m
//  DecimalUtils
//
//  Created by Dmitriy Zakharkin on 7/28/14.
//  Copyright (c) 2014 Dmitriy Zakharkin. All rights reserved.
//

#import "DecimalUtils.h"

static NSRoundingMode _decimalRoundMode = NSRoundPlain;
static NSInteger _decimalScale = -1;

NSRoundingMode decimalRoundingMode() { return _decimalRoundMode; }

void setDecimalRoundingMode(NSRoundingMode mode) { _decimalRoundMode = mode; }

NSInteger decimalScaleMode() { return _decimalScale; }
void setDecimalScaleMode(NSInteger scale) { _decimalScale = scale; }

NSDecimal decimalAdd(const NSDecimal leftOperand,
                     const NSDecimal rightOperand)
{
    NSDecimal result = decimalZero;
    NSDecimalAdd(&result, &leftOperand, &rightOperand, _decimalRoundMode);
    if (_decimalScale != -1)
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    return result;
}

NSDecimal decimalAddDouble(const NSDecimal left, double right)
{
    return decimalAdd(
        left, [[[NSDecimalNumber alloc] initWithDouble:right] decimalValue]);
}

NSDecimal decimalAddNumber(const NSDecimal left, NSNumber* right)
{
    return decimalAdd(left, [right decimalValue]);
}

NSDecimal decimalSubtract(const NSDecimal leftOperand,
                          const NSDecimal rightOperand)
{
    NSDecimal result = decimalZero;
    NSDecimalSubtract(&result, &leftOperand, &rightOperand, _decimalRoundMode);
    if (_decimalScale != -1)
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    return result;
}

NSDecimal decimalSubtractDouble(const NSDecimal left, double right)
{
    return decimalSubtract(
        left, [[[NSDecimalNumber alloc] initWithDouble:right] decimalValue]);
}

NSDecimal decimalSubtractNumber(const NSDecimal left, NSNumber* right)
{
    return decimalSubtract(left, [right decimalValue]);
}

NSDecimal decimalMultiply(const NSDecimal left, const NSDecimal right)
{
    NSDecimal result = decimalZero;
    NSDecimalMultiply(&result, &left, &right, _decimalRoundMode);
    if (_decimalScale != -1)
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    return result;
}

NSDecimal decimalMultiplyDouble(const NSDecimal left, double right)
{
    return decimalMultiply(
        left, [[[NSDecimalNumber alloc] initWithDouble:right] decimalValue]);
}

NSDecimal decimalMultiplyNumber(const NSDecimal left, NSNumber* right)
{
    return decimalMultiply(left, [right decimalValue]);
}

NSDecimal decimalDivide(const NSDecimal left, const NSDecimal right)
{
    NSDecimal result = decimalZero;
    NSDecimalDivide(&result, &left, &right, _decimalRoundMode);
    if (_decimalScale != -1)
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    return result;
}

NSDecimal decimalDivideDouble(const NSDecimal left, double right)
{
    return decimalDivide(
        left, [[[NSDecimalNumber alloc] initWithDouble:right] decimalValue]);
}

NSDecimal decimalDivideNumber(const NSDecimal left, NSNumber* right)
{
    return decimalDivide(left, [right decimalValue]);
}

NSDecimal decimalChangeSign(const NSDecimal dc)
{
    NSDecimal rv = dc;
    rv._isNegative = !rv._isNegative;
    return rv;
}

NSDecimal decimalABS( NSDecimal decimal )
{
	NSDecimal rv = decimal;
	rv._isNegative = 0;
	return rv;
}

NSString* decimalStringValue(const NSDecimal decimalNumber)
{
    NSDecimal result = decimalNumber;
    if (_decimalScale != -1) {
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    }
    return NSDecimalString(&decimalNumber, nil);
}

NSDecimal decimalFromString(NSString* s)
{
    NSDecimalNumber* dn = [NSDecimalNumber decimalNumberWithString:s];
    NSDecimal result = [dn decimalValue];
    if (_decimalScale != -1) {
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    }
    return result;
}

NSDecimal decimalFromInteger(NSInteger val)
{
    NSDecimalNumber* dn = [[NSDecimalNumber alloc] initWithInteger:val];
    NSDecimal result = [dn decimalValue];
    if (_decimalScale != -1) {
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    }
    return result;
}

NSDecimal decimalFromUInteger(NSUInteger val)
{
    NSDecimalNumber* dn = [[NSDecimalNumber alloc] initWithUnsignedInteger:val];
    NSDecimal result = [dn decimalValue];
    if (_decimalScale != -1) {
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    }
    return result;
}

NSDecimal decimalFromFloat(float val)
{
    NSDecimalNumber* dn = [[NSDecimalNumber alloc] initWithFloat:val];
    NSDecimal result = [dn decimalValue];
    if (_decimalScale != -1) {
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    }
    return result;
}

NSDecimal decimalFromDouble(double val)
{
    NSDecimalNumber* dn = [[NSDecimalNumber alloc] initWithDouble:val];
    NSDecimal result = [dn decimalValue];
    if (_decimalScale != -1) {
        NSDecimalRound(&result, &result, _decimalScale, _decimalRoundMode);
    }
    return result;
}

BOOL decimalIsEqual(NSDecimal left, NSDecimal right)
{
    return (NSDecimalCompare(&left, &right) == NSOrderedSame);
}

BOOL decimalIsLeftGrater(const NSDecimal left, const NSDecimal right)
{
    return NSDecimalCompare(&left, &right) == NSOrderedDescending;
}

BOOL decimalIsLeftLess(const NSDecimal left, const NSDecimal right)
{
    return NSDecimalCompare(&left, &right) == NSOrderedAscending;
}

BOOL decimalIsLeftGraterOrEqual(const NSDecimal left, const NSDecimal right)
{
    NSComparisonResult cr = NSDecimalCompare(&left, &right);
    return (cr == NSOrderedSame || cr == NSOrderedDescending);
}

BOOL decimalIsLeftLessOrEqual(const NSDecimal left, const NSDecimal right)
{
    NSComparisonResult cr = NSDecimalCompare(&left, &right);
    return (cr == NSOrderedSame || cr == NSOrderedAscending);
}

NSDecimal decimalMAX( NSDecimal decimalA, NSDecimal decimalB)
{
	if( decimalIsLeftGrater( decimalA, decimalB) )
		return decimalA;
	return decimalB;
}

NSDecimal decimalMIN( NSDecimal decimalA, NSDecimal decimalB)
{
	if( decimalIsLeftLess( decimalA, decimalB) )
		return decimalA;
	return decimalB;
}
