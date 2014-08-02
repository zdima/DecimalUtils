//
//  DecimalUtilsTest.m
//  DecimalUtils
//
//  Created by Dmitriy Zakharkin on 7/28/14.
//  Copyright (c) 2014 Dmitriy Zakharkin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "DecimalUtils.h"

@interface DecimalUtilsTest : XCTestCase

@end

@implementation DecimalUtilsTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testDecimal
{
    NSDecimal zero = decimalZero;
    NSDecimal one = decimalOne;

    setDecimalScaleMode(2);

    XCTAssert(decimalIsEqual(decimalAdd(zero, one), one), @"decimalAdd");
    XCTAssert(decimalIsEqual(decimalAddDouble(zero, 1.0), one), @"decimalAddDouble");
    XCTAssert(decimalIsEqual(decimalAddNumber(zero, [NSNumber numberWithDouble:1.0]), one), @"decimalAddNumber");
    XCTAssert(decimalIsEqual(decimalSubtract(one, one), zero), @"decimalSubtract");
    XCTAssert(decimalIsEqual(decimalSubtractDouble(one, 1.0), zero), @"decimalSubtractDouble");
    XCTAssert(decimalIsEqual(decimalSubtractNumber(one, [NSNumber numberWithDouble:1.0]), zero), @"decimalSubtractNumber");
    XCTAssert(decimalIsEqual(decimalMultiply(decimalFromDouble(2.0), decimalFromDouble(3.0)), decimalFromDouble(6.0)), @"decimalMultiply");
    XCTAssert(decimalIsEqual(decimalMultiplyDouble(decimalFromDouble(2.0), 3.0), decimalFromDouble(6.0)), @"decimalMultiplyDouble");
    XCTAssert(decimalIsEqual(decimalMultiplyNumber(decimalFromDouble(2.0), [NSNumber numberWithDouble:3.0]), decimalFromDouble(6.0)), @"decimalMultiplyNumber");
    XCTAssert(decimalIsEqual(decimalDivide(decimalFromDouble(17.0), decimalFromDouble(3.0)), decimalFromDouble(5.67)), @"decimalDivide");
    XCTAssert(decimalIsEqual(decimalDivideDouble(decimalFromDouble(17.0), 3.0), decimalFromDouble(5.67)), @"decimalDivideDouble");
    XCTAssert(decimalIsEqual(decimalDivideNumber(decimalFromDouble(17.0), [NSNumber numberWithDouble:3.0]), decimalFromDouble(5.67)), @"decimalDivideNumber");
    XCTAssert(decimalIsEqual(decimalChangeSign(decimalFromDouble(17.0)), decimalFromDouble(-17.0)), @"decimalChangeSign");
    XCTAssert(decimalIsEqual(decimalFromDouble(17.0), decimalFromDouble(17.0)), @"decimalIsEqual");
    XCTAssert(decimalIsLeftGrater(decimalFromDouble(17.0), decimalFromDouble(15.0)), @"decimalIsLeftGrater");
    XCTAssert(decimalIsLeftLess(decimalFromDouble(17.0), decimalFromDouble(18.0)), @"decimalIsLeftLess");
    XCTAssert(decimalIsLeftGraterOrEqual(decimalFromDouble(17.0), decimalFromDouble(15.0)), @"decimalIsLeftGraterOrEqual");
    XCTAssert(decimalIsLeftGraterOrEqual(decimalFromDouble(17.0), decimalFromDouble(17.0)), @"decimalIsLeftGraterOrEqual");
    XCTAssert(decimalIsLeftLessOrEqual(decimalFromDouble(17.0), decimalFromDouble(18.0)), @"decimalIsLeftLessOrEqual");
    XCTAssert(decimalIsLeftLessOrEqual(decimalFromDouble(17.0), decimalFromDouble(17.0)), @"decimalIsLeftLessOrEqual");

	XCTAssert( decimalIsEqual( decimalFromDouble(18.0), decimalMAX(decimalFromDouble(18.0), decimalFromDouble(1.8))), @"decimalMAX 18-1.8=18");
	XCTAssert( decimalIsEqual( decimalFromDouble(18.0), decimalMAX(decimalFromDouble(1.8), decimalFromDouble(18.0))), @"decimalMAX 1.8-18=18");
	XCTAssert( decimalIsEqual( decimalFromDouble(18.0), decimalMAX(decimalFromDouble(17.0), decimalFromDouble(18.0))), @"decimalMAX 17-18=18");
	XCTAssert( decimalIsEqual( decimalFromDouble(18.0), decimalMAX(decimalFromDouble(18.0), decimalFromDouble(17.0))), @"decimalMAX 18-17=18");
	XCTAssert( decimalIsEqual( decimalFromDouble(1867.0), decimalMAX(decimalFromDouble(17.0), decimalFromDouble(1867.0))), @"decimalMAX 17-1867=1867");
	XCTAssert( decimalIsEqual( decimalFromDouble(1867.0), decimalMAX(decimalFromDouble(1867.0), decimalFromDouble(17.0))), @"decimalMAX 1867-17=1867");
	XCTAssert( decimalIsEqual( decimalFromDouble(17.0), decimalMAX(decimalFromDouble(17.0), decimalFromDouble(-17.0))), @"decimalMAX 17-(-17)=17");
	XCTAssert( decimalIsEqual( decimalFromDouble(17.0), decimalMAX(decimalFromDouble(-17.0), decimalFromDouble(17.0))), @"decimalMAX (-17)-17=17");
	XCTAssert( decimalIsEqual( decimalFromDouble(17.0), decimalMAX(decimalFromDouble(17.0), decimalFromDouble(17.0))), @"decimalMAX 17-17=17");
	XCTAssert( decimalIsEqual( decimalFromDouble(-17.0), decimalMAX(decimalFromDouble(-17.0), decimalFromDouble(-17.0))), @"decimalMAX (-17)-(-17)=(-17)");
	XCTAssert( decimalIsEqual( decimalZero, decimalMAX(decimalZero, decimalZero)), @"decimalMAX 0-0=0");

	XCTAssert( decimalIsEqual( decimalFromDouble(17.0), decimalMIN(decimalFromDouble(17.0), decimalFromDouble(18.0))), @"decimalMIN 17-18=17");
	XCTAssert( decimalIsEqual( decimalFromDouble(17.0), decimalMIN(decimalFromDouble(18.0), decimalFromDouble(17.0))), @"decimalMIN 18-17=17");
	XCTAssert( decimalIsEqual( decimalFromDouble(17.0), decimalMIN(decimalFromDouble(17.0), decimalFromDouble(1867.0))), @"decimalMIN 17-1867=17");
	XCTAssert( decimalIsEqual( decimalFromDouble(17.0), decimalMIN(decimalFromDouble(1867.0), decimalFromDouble(17.0))), @"decimalMIN 1867-17=17");
	XCTAssert( decimalIsEqual( decimalFromDouble(-17.0), decimalMIN(decimalFromDouble(17.0), decimalFromDouble(-17.0))), @"decimalMIN 17-(-17)=(-17)");
	XCTAssert( decimalIsEqual( decimalFromDouble(-17.0), decimalMIN(decimalFromDouble(-17.0), decimalFromDouble(17.0))), @"decimalMIN (-17)-17=(-17)");
	XCTAssert( decimalIsEqual( decimalFromDouble(17.0), decimalMIN(decimalFromDouble(17.0), decimalFromDouble(17.0))), @"decimalMIN 17-17=17");
	XCTAssert( decimalIsEqual( decimalFromDouble(-17.0), decimalMIN(decimalFromDouble(-17.0), decimalFromDouble(-17.0))), @"decimalMIN (-17)-(-17)=(-17)");
	XCTAssert( decimalIsEqual( decimalZero, decimalMIN(decimalZero, decimalZero)), @"decimalMIN 0-0=0");
	
    setDecimalScaleMode(4);
    XCTAssert(decimalIsEqual(decimalDivideDouble(decimalFromDouble(17.0), 3.0), decimalFromDouble(5.6667)), @"decimalDivideDouble");
}

- (void)testPerformanceCopy
{
    [self measureBlock:^{
        NSDecimal val = decimalZero;
        for( NSInteger n=0; n < 10000; n++ ) {
            val = decimalZero;
        }
    }];
}

- (void)testPerformanceAdd
{
    [self measureBlock:^{
        NSDecimal val = decimalZero;
        for( NSInteger n=0; n < 10000; n++ ) {
            val = decimalAdd( val, decimalOne );
        }
    }];
}

- (void)testPerformanceMultiply
{
    [self measureBlock:^{
        NSDecimal val = decimalZero;
        NSDecimal two = decimalAdd( decimalOne, decimalOne);
        for( NSInteger n=0; n < 10000; n++ ) {
            val = decimalMultiply(val, two);
        }
    }];
}

- (void)testPerformanceDivide
{
    [self measureBlock:^{
        NSDecimal val = decimalOne;
        NSDecimal two = decimalAdd( decimalOne, decimalOne);
        for( NSInteger n=0; n < 10000; n++ ) {
            val = decimalDivide( val, two);
        }
    }];
}

@end
