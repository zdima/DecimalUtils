//
//  DecimalUtils.h
//
//  Created by Dmitriy Zakharkin on 7/28/14.
//  Copyright (c) 2014 Dmitriy Zakharkin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Rounding policies :
 * Original
 *    value 1.2  1.21  1.25  1.35  1.27
 * Plain    1.2  1.2   1.3   1.4   1.3
 * Down     1.2  1.2   1.2   1.3   1.2
 * Up       1.2  1.3   1.3   1.4   1.3
 * Bankers  1.2  1.2   1.2   1.4   1.3
 *
 * NSRoundPlain,   // Round up on a tie   * DEFAULT
 * NSRoundDown,    // Always down == truncate
 * NSRoundUp,      // Always up
 * NSRoundBankers  // on a tie round so last digit is even
 *
 * @return current NSRoundingMode
 */
NSRoundingMode decimalRoundingMode();

/**
 * Set rounding mode for decimal operations
 *
 * @param mode NSRoundingMode
 */
void setDecimalRoundingMode(NSRoundingMode mode);

/**
 * scale for return values which indicates number of significant
 * digits after the decimal point.
 * DEFAULT is no scale (-1)
 *
 * @return NSInteger
 */
NSInteger decimalScaleMode();

/**
 * Set scale indicates number of significant digits after the decimal point
 * Negative value indeicate do not scale
 *
 * @param scale NSInteger
 */
void setDecimalScaleMode(NSInteger scale);

/**
 * produce sum of left and right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal sum of left and right
 */
NSDecimal decimalAdd(const NSDecimal left, const NSDecimal right);

/**
 * produce sum of left and right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal sum of left and right
 */
NSDecimal decimalAddDouble(const NSDecimal left, double right);

/**
 * produce sum of left and right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal sum of left and right
 */
NSDecimal decimalAddNumber(const NSDecimal left, NSNumber *right);

/**
 * produce difference between left and right,  left - right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal difference between left and right
 */
NSDecimal decimalSubtract(const NSDecimal left, const NSDecimal right);

/**
 * produce difference between left and right,  left - right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal difference between left and right
 */
NSDecimal decimalSubtractDouble(const NSDecimal left, double right);

/**
 * produce difference between left and right,  left - right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal difference between left and right
 */
NSDecimal decimalSubtractNumber(const NSDecimal left, NSNumber *right);

/**
 * return NSDecimal produce of left * right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal produce of left * right
 */
NSDecimal decimalMultiply(const NSDecimal left, const NSDecimal right);

/**
 * return NSDecimal produce of left * right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal produce of left * right
 */
NSDecimal decimalMultiplyDouble(const NSDecimal left, double right);

/**
 * return NSDecimal produce of left * right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal produce of left * right
 */
NSDecimal decimalMultiplyNumber(const NSDecimal left, NSNumber *right);

/**
 * return NSDecimal produce of left / right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal produce of left * right
 */
NSDecimal decimalDivide(const NSDecimal left, const NSDecimal right);

/**
 * return NSDecimal produce of left / right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal produce of left * right
 */
NSDecimal decimalDivideDouble(const NSDecimal left, double right);

/**
 * return NSDecimal produce of left / right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return NSDecimal produce of left * right
 */
NSDecimal decimalDivideNumber(const NSDecimal left, NSNumber *right);

/**
 * Chnage the sign of dc
 *
 * @param dc NSDecimal
 *
 * @return NSDecimal invers of argument
 */
NSDecimal decimalChangeSign(const NSDecimal dc);

/**
 * check if left and right equal
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return TRUE if left and right equal
 */
BOOL decimalIsEqual(const NSDecimal left, const NSDecimal right);

/**
 * check if left grater than right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return TRUE if left grater than right
 */
BOOL decimalIsLeftGrater(const NSDecimal left, const NSDecimal right);

/**
 * check if left less than right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return TRUE if left grater than right
 */
BOOL decimalIsLeftLess(const NSDecimal left, const NSDecimal right);

/**
 * check if left grater or equal right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return TRUE if left grater than right
 */
BOOL decimalIsLeftGraterOrEqual(const NSDecimal left, const NSDecimal right);

/**
 * check if left less or equal right
 *
 * @param left  left operand
 * @param right right operand
 *
 * @return TRUE if left grater than right
 */
BOOL decimalIsLeftLessOrEqual(const NSDecimal left, const NSDecimal right);

/**
 * return NSString represendting NSDecimal
 *
 * @param decimalNumber NSDecimal
 *
 * @return NSString
 */
NSString *decimalStringValue(const NSDecimal decimalNumber);

/**
 * convert NSString to NSDecimal
 *
 * @param NSString*
 *
 * @return NSDecimal
 */
NSDecimal decimalFromString(NSString *);

/**
 * convert NSInteger to NSDecimal
 *
 * @param NSInteger
 *
 * @return NSDecimal
 */
NSDecimal decimalFromInteger(NSInteger);

/**
 * convert NSUInteger to NSDecimal
 *
 * @param NSUInteger
 *
 * @return NSDecimal
 */
NSDecimal decimalFromUInteger(NSUInteger);

/**
 * convert float to NSDecimal
 *
 * @param float
 *
 * @return NSDecimal
 */
NSDecimal decimalFromFloat(float);

/**
 * convert double to NSDecimal
 *
 * @param double
 *
 * @return NSDecimal
 */
NSDecimal decimalFromDouble(double);

/**
 * NSDecimal representing 0
 */
static NSDecimal decimalZero = {0, 0, NO, YES, 0, {0}};

/**
 * NSDecimal representing 1
 */
static NSDecimal decimalOne = {0, 1, NO, YES, 0, {1}};
