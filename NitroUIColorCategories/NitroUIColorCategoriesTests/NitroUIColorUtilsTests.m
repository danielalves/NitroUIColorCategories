//
//  NitroUIColorCategoriesTests.m
//  NitroUIColorCategoriesTests
//
//  Created by Daniel L. Alves on 28/05/14.
//  Copyright (c) 2014 Daniel L. Alves. All rights reserved.
//

#import <XCTest/XCTest.h>

// NitroUIColorCategories
#import "UIColor+Utils_Nitro.h"

// pods
#import <NitroMath/NTRMath.h>

#pragma mark - Helper Macros

#define COLOR_COMPONENTS_DICT_WITH( red, green, blue, alpha ) \
@{                                                  \
    COLOR_DICT_COMPONENT_KEY_RED: @( red ),         \
    COLOR_DICT_COMPONENT_KEY_GREEN: @( green ),     \
    COLOR_DICT_COMPONENT_KEY_BLUE: @( blue ),       \
    COLOR_DICT_COMPONENT_KEY_ALPHA: @( alpha )      \
}

#pragma mark - Interface

@interface NitroUIColorCategoriesTests : XCTestCase
@end

#pragma mark - Implementation

@implementation NitroUIColorCategoriesTests

#pragma mark - RGBA_TO_HEX macro tests

-( void )test_RGBA_TO_HEX_returns_rgba_color_hexadecimal_value
{
    XCTAssertEqual( RGBA_TO_HEX(   0,   0,   0, 255 ), 0x000000FF );
    XCTAssertEqual( RGBA_TO_HEX( 255, 255, 255, 255 ), 0xFFFFFFFF );
    
    XCTAssertEqual( RGBA_TO_HEX( 255,   0,   0, 255 ), 0xFF0000FF );
    XCTAssertEqual( RGBA_TO_HEX(   0, 255,   0, 255 ), 0x00FF00FF );
    XCTAssertEqual( RGBA_TO_HEX(   0,   0, 255, 255 ), 0x0000FFFF );
    
    XCTAssertEqual( RGBA_TO_HEX( 255,   0, 255, 128 ), 0xFF00FF80 );
    XCTAssertEqual( RGBA_TO_HEX(   0, 255, 255,   0 ), 0x00FFFF00 );
    
    XCTAssertEqual( RGBA_TO_HEX(   0,   0,   0,   0 ), 0x00000000 );
}

#pragma mark - ARGB_TO_HEX macro tests

-( void )test_ARGB_TO_HEX_returns_rgba_color_hexadecimal_value
{
    XCTAssertEqual( ARGB_TO_HEX( 255,   0,   0,   0 ), 0xFF000000 );
    XCTAssertEqual( ARGB_TO_HEX( 255, 255, 255, 255 ), 0xFFFFFFFF );
    
    XCTAssertEqual( ARGB_TO_HEX( 255, 255,   0,   0 ), 0xFFFF0000 );
    XCTAssertEqual( ARGB_TO_HEX( 255,   0, 255,   0 ), 0xFF00FF00 );
    XCTAssertEqual( ARGB_TO_HEX( 255,   0,   0, 255 ), 0xFF0000FF );
    
    XCTAssertEqual( ARGB_TO_HEX( 128, 255,   0, 255 ), 0x80FF00FF );
    XCTAssertEqual( ARGB_TO_HEX(   0,   0, 255, 255 ), 0x0000FFFF );
    
    XCTAssertEqual( ARGB_TO_HEX(   0,   0,   0,   0 ), 0x00000000 );
}

#pragma mark - colorWithByteRed:byteGreen:byteBlue: tests

-( void )test_colorWithByteRed_byteGreen_byteBlue_returns_correct_color
{
    UIColor *color = [UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 0];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );

    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );

    color = [UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 255];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    
    color = [UIColor colorWithByteRed: 255 byteGreen: 0 byteBlue: 0];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorWithByteRed: 0 byteGreen: 255 byteBlue: 0];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 255];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
}

-( void )test_colorWithByteRed_byteGreen_byteBlue_always_returns_opaque_colors
{
    UIColor *color = [UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 0];
    XCTAssertEqual( color.byteAlpha, 255 );
    XCTAssertEqual( color.alpha, 1.0f );
    
    color = [UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 255];
    XCTAssertEqual( color.byteAlpha, 255 );
    XCTAssertEqual( color.alpha, 1.0f );
    
    color = [UIColor colorWithByteRed: 255 byteGreen: 0 byteBlue: 0];
    XCTAssertEqual( color.byteAlpha, 255 );
    XCTAssertEqual( color.alpha, 1.0f );
    
    color = [UIColor colorWithByteRed: 0 byteGreen: 255 byteBlue: 0];
    XCTAssertEqual( color.byteAlpha, 255 );
    XCTAssertEqual( color.alpha, 1.0f );
    
    color = [UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 255];
    XCTAssertEqual( color.byteAlpha, 255 );
    XCTAssertEqual( color.alpha, 1.0f );
}

#pragma mark - colorWithByteRedbyteGreen:byteBlue:byteAlpha: tests

-( void )test_colorWithByteRed_byteGreen_byteBlue_byteAlpha_returns_correct_color
{
    UIColor *color = [UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 0 byteAlpha: 255];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 255 byteAlpha: 255];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorWithByteRed: 255 byteGreen: 0 byteBlue: 0 byteAlpha: 255];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorWithByteRed: 0 byteGreen: 255 byteBlue: 0 byteAlpha: 255];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 255 byteAlpha: 255];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorWithByteRed: 255 byteGreen: 0 byteBlue: 255 byteAlpha: 128];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, ( CGFloat )( 128.0f / 255.0f ));
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 128 );
    
    color = [UIColor colorWithByteRed: 0 byteGreen: 255 byteBlue: 255 byteAlpha: 0];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
}

#pragma mark - colorFromRGBHex: tests

-( void )test_colorFromRGBHex_returns_correct_color
{
    UIColor *color = [UIColor colorFromRGBHex: 0x000000];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHex: 0xFFFFFF];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    
    color = [UIColor colorFromRGBHex: 0xFF0000];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHex: 0x00FF00];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHex: 0x0000FF];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
}

-( void )test_colorFromRGBHex_always_returns_opaque_colors
{
    UIColor *color = [UIColor colorFromRGBHex: 0x000000];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHex: 0xFFFFFF];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHex: 0xFF0000];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHex: 0x00FF00];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHex: 0x0000FF];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
}

#pragma mark - colorFromRGBAHex: tests

-( void )test_colorFromRGBAHex_returns_correct_color
{
    UIColor *color = [UIColor colorFromRGBAHex: 0x000000FF];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHex: 0xFFFFFFFF];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHex: 0xFF0000FF];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHex: 0x00FF00FF];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHex: 0x0000FFFF];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHex: 0xFF00FF00];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromRGBAHex: 0x00000000];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromRGBAHex: 0x00FFFF80];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 128.0f / 255.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 128 );
}

#pragma mark - colorFromARGBHex: tests

-( void )test_colorFromARGBHex_returns_correct_color
{
    UIColor *color = [UIColor colorFromARGBHex: 0xFF000000];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHex: 0xFFFFFFFF];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHex: 0xFFFF0000];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHex: 0xFF00FF00];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHex: 0xFF0000FF];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHex: 0x00FF00FF];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromARGBHex: 0x00000000];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromARGBHex: 0x8000FFFF];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 128.0f / 255.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 128 );
}

#pragma mark - colorFromRGBHexString: tests

-( void )test_colorFromRGBHexString_returns_correct_color
{
    UIColor *color = [UIColor colorFromRGBHexString: @"0x000000"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHexString: @"0xFFFFFF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0xFF0000"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHexString: @"0x00FF00"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHexString: @"0x0000FF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
}

-( void )test_colorFromRGBHexString_works_without_prefix
{
    UIColor *color = [UIColor colorFromRGBHexString: @"000000"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHexString: @"FFFFFF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    
    color = [UIColor colorFromRGBHexString: @"FF0000"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHexString: @"00FF00"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromRGBHexString: @"0000FF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
}

-( void )test_colorFromRGBHexString_always_returns_opaque_colors
{
    UIColor *color = [UIColor colorFromRGBHexString: @"0x000000"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0xFFFFFF"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0xFF0000"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0x00FF00"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0x0000FF"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
}

-( void )test_colorFromRGBHexString_returns_opaque_colors_even_for_AARRGGBB_strings
{
    UIColor *color = [UIColor colorFromRGBHexString: @"0x80000000"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0x80FFFFFF"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0xDDFF0000"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0xEE00FF00"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBHexString: @"0x200000FF"];
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
}

#pragma mark - colorFromRGBAHexString: tests

-( void )test_colorFromRGBAHexString_returns_correct_color
{
    UIColor *color = [UIColor colorFromRGBAHexString: @"0x000000FF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"0xFFFFFFFF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"0xFF0000FF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"0x00FF00FF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"0x0000FFFF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"0xFF00FF00"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromRGBAHexString: @"0x00000000"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromRGBAHexString: @"0x00FFFF80"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 128.0f / 255.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 128 );
}

-( void )test_colorFromRGBAHexString_works_without_prefix
{
    UIColor *color = [UIColor colorFromRGBAHexString: @"000000FF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"FFFFFFFF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"FF0000FF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"00FF00FF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"0000FFFF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromRGBAHexString: @"FF00FF00"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromRGBAHexString: @"00000000"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromRGBAHexString: @"00FFFF80"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 128.0f / 255.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 128 );
}

#pragma mark - colorFromARGBHexString: tests

-( void )test_colorFromARGBHexString_returns_correct_color
{
    UIColor *color = [UIColor colorFromARGBHexString: @"0xFF000000"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"0xFFFFFFFF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"0xFFFF0000"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"0xFF00FF00"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"0xFF0000FF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"0x00FF00FF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromARGBHexString: @"0x00000000"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromARGBHexString: @"0x8000FFFF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 128.0f / 255.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 128 );
}

-( void )test_colorFromARGBHexString_works_without_prefix
{
    UIColor *color = [UIColor colorFromARGBHexString: @"FF000000"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"FFFFFFFF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"FFFF0000"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"FF00FF00"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"FF0000FF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromARGBHexString: @"00FF00FF"];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromARGBHexString: @"00000000"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromARGBHexString: @"8000FFFF"];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 128.0f / 255.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 128 );
}

#pragma mark - colorFromColorComponentsDictionary: tests

-( void )test_colorFromColorComponentsDictionary_returns_correct_color
{
    UIColor *color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0.0f, 0.0f, 0.0f, 1.0f )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, 1.0f, 1.0f, 1.0f )];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, 0.0f, 0.0f, 1.0f )];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0.0f, 1.0f, 0.0f, 1.0f )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0.0f, 0.0f, 1.0f, 1.0f )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, 0.0f, 1.0f, 0.0f )];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0.0f, 0.0f, 0.0f, 0.0f )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0.0f, 1.0f, 1.0f, 0.5f )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.5f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, ( uint8_t )( 255 * 0.5f ) );
}

-( void )test_colorFromColorComponentsDictionary_sets_missing_components_as_0
{
    UIColor *color = [UIColor colorFromColorComponentsDictionary: @{
                                                                        COLOR_DICT_COMPONENT_KEY_GREEN: @( 1.0f ),
                                                                        COLOR_DICT_COMPONENT_KEY_BLUE: @( 1.0f ),
                                                                        COLOR_DICT_COMPONENT_KEY_ALPHA: @( 1.0f )
                                                                  }];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.byteRed, 0 );
    
    color = [UIColor colorFromColorComponentsDictionary: @{
                                                               COLOR_DICT_COMPONENT_KEY_RED: @( 1.0f ),
                                                               COLOR_DICT_COMPONENT_KEY_BLUE: @( 1.0f ),
                                                               COLOR_DICT_COMPONENT_KEY_ALPHA: @( 1.0f )
                                                         }];
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.byteGreen, 0 );
    
    color = [UIColor colorFromColorComponentsDictionary: @{
                                                               COLOR_DICT_COMPONENT_KEY_RED: @( 1.0f ),
                                                               COLOR_DICT_COMPONENT_KEY_GREEN: @( 1.0f ),
                                                               COLOR_DICT_COMPONENT_KEY_ALPHA: @( 1.0f )
                                                         }];
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromColorComponentsDictionary: @{
                                                               COLOR_DICT_COMPONENT_KEY_RED: @( 1.0f ),
                                                               COLOR_DICT_COMPONENT_KEY_GREEN: @( 1.0f ),
                                                               COLOR_DICT_COMPONENT_KEY_BLUE: @( 1.0f )
                                                         }];
    XCTAssertEqual( color.alpha, 0.0f );
    XCTAssertEqual( color.byteAlpha, 0 );
}

-( void )test_colorFromColorComponentsDictionary_sets_values_below_0_as_0
{
    UIColor *color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( -2.0f, 1.0f, 1.0f, 1.0f )];
    
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.byteRed, 0 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, -0.1f, 1.0f, 1.0f )];
    
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.byteGreen, 0 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, 1.0f, -0.00005f, 1.0f )];
    
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, 1.0f, 1.0f, -672.88f )];
    
    XCTAssertEqual( color.alpha, 0.0f );
    XCTAssertEqual( color.byteAlpha, 0 );
}

-( void )test_colorFromColorComponentsDictionary_sets_values_above_1_as_1
{
    UIColor *color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 2.0f, 1.0f, 1.0f, 1.0f )];
    
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.byteRed, 255 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, 1.1f, 1.0f, 1.0f )];
    
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.byteGreen, 255 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, 1.0f, 1.00005f, 1.0f )];
    
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.byteBlue, 255 );
    
    color = [UIColor colorFromColorComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 1.0f, 1.0f, 1.0f, 672.88f )];
    
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
}

#pragma mark - colorFromColorByteComponentsDictionary: tests

-( void )test_colorFromColorByteComponentsDictionary_returns_correct_color
{
    UIColor *color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0, 0, 0, 255 )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, 255, 255, 255 )];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, 0, 0, 255 )];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0, 255, 0, 255 )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0, 0, 255, 255 )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 1.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 255 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, 0, 255, 0 )];
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 255 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0, 0, 0, 0 )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.alpha, 0.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 0 );
    XCTAssertEqual( color.byteBlue, 0 );
    XCTAssertEqual( color.byteAlpha, 0 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 0, 255, 255, 128 )];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.alpha, 128.0f / 255.0f );
    
    XCTAssertEqual( color.byteRed, 0 );
    XCTAssertEqual( color.byteGreen, 255 );
    XCTAssertEqual( color.byteBlue, 255 );
    XCTAssertEqual( color.byteAlpha, 128 );
}

-( void )test_colorFromColorByteComponentsDictionary_sets_missing_components_as_0
{
    UIColor *color = [UIColor colorFromColorByteComponentsDictionary: @{
                                                                           COLOR_DICT_COMPONENT_KEY_GREEN: @( 255 ),
                                                                           COLOR_DICT_COMPONENT_KEY_BLUE: @( 255 ),
                                                                           COLOR_DICT_COMPONENT_KEY_ALPHA: @( 255 )
                                                                      }];
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.byteRed, 0 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: @{
                                                                  COLOR_DICT_COMPONENT_KEY_RED: @( 255 ),
                                                                  COLOR_DICT_COMPONENT_KEY_BLUE: @( 255 ),
                                                                  COLOR_DICT_COMPONENT_KEY_ALPHA: @( 255 )
                                                             }];
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.byteGreen, 0 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: @{
                                                                   COLOR_DICT_COMPONENT_KEY_RED: @( 255 ),
                                                                   COLOR_DICT_COMPONENT_KEY_GREEN: @( 255 ),
                                                                   COLOR_DICT_COMPONENT_KEY_ALPHA: @( 255 )
                                                             }];
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: @{
                                                                  COLOR_DICT_COMPONENT_KEY_RED: @( 255 ),
                                                                  COLOR_DICT_COMPONENT_KEY_GREEN: @( 255 ),
                                                                  COLOR_DICT_COMPONENT_KEY_BLUE: @( 255 )
                                                             }];
    XCTAssertEqual( color.alpha, 0.0f );
    XCTAssertEqual( color.byteAlpha, 0 );
}

-( void )test_colorFromColorByteComponentsDictionary_sets_values_below_0_as_0
{
    UIColor *color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( -2, 255, 255, 255 )];
    
    XCTAssertEqual( color.red, 0.0f );
    XCTAssertEqual( color.byteRed, 0 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, -300, 255, 255 )];
    
    XCTAssertEqual( color.green, 0.0f );
    XCTAssertEqual( color.byteGreen, 0 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, 255, -1, 255 )];
    
    XCTAssertEqual( color.blue, 0.0f );
    XCTAssertEqual( color.byteBlue, 0 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, 255, 255, -1873 )];
    
    XCTAssertEqual( color.alpha, 0.0f );
    XCTAssertEqual( color.byteAlpha, 0 );
}

-( void )test_colorFromColorByteComponentsDictionary_sets_values_above_255_as_255
{
    UIColor *color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 256, 255, 255, 255 )];
    
    XCTAssertEqual( color.red, 1.0f );
    XCTAssertEqual( color.byteRed, 255 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, 300, 255, 255 )];
    
    XCTAssertEqual( color.green, 1.0f );
    XCTAssertEqual( color.byteGreen, 255 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, 255, 1000, 255 )];
    
    XCTAssertEqual( color.blue, 1.0f );
    XCTAssertEqual( color.byteBlue, 255 );
    
    color = [UIColor colorFromColorByteComponentsDictionary: COLOR_COMPONENTS_DICT_WITH( 255, 255, 255, 9911 )];
    
    XCTAssertEqual( color.alpha, 1.0f );
    XCTAssertEqual( color.byteAlpha, 255 );
}

#pragma mark - red tests

-( void )test_red_returns_color_red_component
{
    CGFloat redComponent = [UIColor blackColor].red;
    XCTAssertEqual( redComponent, 0.0f );
    
    redComponent = [UIColor whiteColor].red;
    XCTAssertEqual( redComponent, 1.0f );
    
    redComponent = [UIColor redColor].red;
    XCTAssertEqual( redComponent, 1.0f );
    
    redComponent = [UIColor greenColor].red;
    XCTAssertEqual( redComponent, 0.0f );
    
    redComponent = [UIColor blueColor].red;
    XCTAssertEqual( redComponent, 0.0f );
    
    redComponent = [UIColor colorWithWhite: 1.0f alpha: 0.0f].red;
    XCTAssertEqual( redComponent, 1.0f );
    
    redComponent = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].red;
    XCTAssertEqual( redComponent, 1.0f );
}

#pragma mark - green tests

-( void )test_green_returns_color_green_component
{
    CGFloat greenComponent = [UIColor blackColor].green;
    XCTAssertEqual( greenComponent, 0.0f );
    
    greenComponent = [UIColor whiteColor].green;
    XCTAssertEqual( greenComponent, 1.0f );
    
    greenComponent = [UIColor redColor].green;
    XCTAssertEqual( greenComponent, 0.0f );
    
    greenComponent = [UIColor greenColor].green;
    XCTAssertEqual( greenComponent, 1.0f );
    
    greenComponent = [UIColor blueColor].green;
    XCTAssertEqual( greenComponent, 0.0f );
    
    greenComponent = [UIColor colorWithWhite: 1.0f alpha: 0.0f].green;
    XCTAssertEqual( greenComponent, 1.0f );
    
    greenComponent = [UIColor colorWithRed: 1.0f green: 1.0f blue: 0.0f alpha: 0.5f].green;
    XCTAssertEqual( greenComponent, 1.0f );
}

#pragma mark - blue tests

-( void )test_blue_returns_color_blue_component
{
    CGFloat blueComponent = [UIColor blackColor].blue;
    XCTAssertEqual( blueComponent, 0.0f );
    
    blueComponent = [UIColor whiteColor].blue;
    XCTAssertEqual( blueComponent, 1.0f );
    
    blueComponent = [UIColor redColor].blue;
    XCTAssertEqual( blueComponent, 0.0f );
    
    blueComponent = [UIColor greenColor].blue;
    XCTAssertEqual( blueComponent, 0.0f );
    
    blueComponent = [UIColor blueColor].blue;
    XCTAssertEqual( blueComponent, 1.0f );
    
    blueComponent = [UIColor colorWithWhite: 1.0f alpha: 0.0f].blue;
    XCTAssertEqual( blueComponent, 1.0f );
    
    blueComponent = [UIColor colorWithRed: 0.0f green: 1.0f blue: 1.0f alpha: 0.5f].blue;
    XCTAssertEqual( blueComponent, 1.0f );
}

#pragma mark - alpha tests

-( void )test_alpha_returns_color_alpha_component
{
    CGFloat alphaComponent = [UIColor blackColor].alpha;
    XCTAssertEqual( alphaComponent, 1.0f );
    
    alphaComponent = [UIColor whiteColor].alpha;
    XCTAssertEqual( alphaComponent, 1.0f );
    
    alphaComponent = [UIColor redColor].alpha;
    XCTAssertEqual( alphaComponent, 1.0f );
    
    alphaComponent = [UIColor greenColor].alpha;
    XCTAssertEqual( alphaComponent, 1.0f );
    
    alphaComponent = [UIColor blueColor].alpha;
    XCTAssertEqual( alphaComponent, 1.0f );
    
    alphaComponent = [UIColor colorWithWhite: 1.0f alpha: 0.0f].alpha;
    XCTAssertEqual( alphaComponent, 0.0f );
    
    alphaComponent = [UIColor colorWithRed: 0.0f green: 1.0f blue: 1.0f alpha: 0.5f].alpha;
    XCTAssertEqual( alphaComponent, 0.5f );
}

#pragma mark - byteRed tests

-( void )test_byteRed_returns_color_red_component_byte_value
{
    uint8_t byteRedComponent = [UIColor blackColor].byteRed;
    XCTAssertEqual( byteRedComponent, 0 );
    
    byteRedComponent = [UIColor whiteColor].byteRed;
    XCTAssertEqual( byteRedComponent, 255 );
    
    byteRedComponent = [UIColor redColor].byteRed;
    XCTAssertEqual( byteRedComponent, 255 );
    
    byteRedComponent = [UIColor greenColor].byteRed;
    XCTAssertEqual( byteRedComponent, 0 );
    
    byteRedComponent = [UIColor blueColor].byteRed;
    XCTAssertEqual( byteRedComponent, 0 );
    
    byteRedComponent = [UIColor colorWithWhite: 1.0f alpha: 0].byteRed;
    XCTAssertEqual( byteRedComponent, 255 );
    
    byteRedComponent = [UIColor colorWithRed: 1.0f green: 0 blue: 1.0f alpha: 0.5f].byteRed;
    XCTAssertEqual( byteRedComponent, 255 );
}

#pragma mark - byteGreen tests

-( void )test_byteGreen_returns_color_green_component_byte_value
{
    uint8_t byteGreenComponent = [UIColor blackColor].byteGreen;
    XCTAssertEqual( byteGreenComponent, 0 );
    
    byteGreenComponent = [UIColor whiteColor].byteGreen;
    XCTAssertEqual( byteGreenComponent, 255 );
    
    byteGreenComponent = [UIColor redColor].byteGreen;
    XCTAssertEqual( byteGreenComponent, 0 );
    
    byteGreenComponent = [UIColor greenColor].byteGreen;
    XCTAssertEqual( byteGreenComponent, 255 );
    
    byteGreenComponent = [UIColor blueColor].byteGreen;
    XCTAssertEqual( byteGreenComponent, 0 );
    
    byteGreenComponent = [UIColor colorWithWhite: 1.0f alpha: 0.0f].byteGreen;
    XCTAssertEqual( byteGreenComponent, 255 );
    
    byteGreenComponent = [UIColor colorWithRed: 1.0f green: 1.0f blue: 0.0f alpha: 0.5f].byteGreen;
    XCTAssertEqual( byteGreenComponent, 255 );
}

#pragma mark - byteBlue tests

-( void )test_byteBlue_returns_color_blue_component_byte_value
{
    CGFloat byteBlueComponent = [UIColor blackColor].byteBlue;
    XCTAssertEqual( byteBlueComponent, 0 );
    
    byteBlueComponent = [UIColor whiteColor].byteBlue;
    XCTAssertEqual( byteBlueComponent, 255 );
    
    byteBlueComponent = [UIColor redColor].byteBlue;
    XCTAssertEqual( byteBlueComponent, 0 );
    
    byteBlueComponent = [UIColor greenColor].byteBlue;
    XCTAssertEqual( byteBlueComponent, 0 );
    
    byteBlueComponent = [UIColor blueColor].byteBlue;
    XCTAssertEqual( byteBlueComponent, 255 );
    
    byteBlueComponent = [UIColor colorWithWhite: 1.0f alpha: 0.0f].byteBlue;
    XCTAssertEqual( byteBlueComponent, 255 );
    
    byteBlueComponent = [UIColor colorWithRed: 0.0f green: 1.0f blue: 1.0f alpha: 0.5f].byteBlue;
    XCTAssertEqual( byteBlueComponent, 255 );
}

#pragma mark - byteAlpha tests

-( void )test_byteAlpha_returns_color_alpha_component_byte_value
{
    CGFloat byteAlphaComponent = [UIColor blackColor].byteAlpha;
    XCTAssertEqual( byteAlphaComponent, 255 );
    
    byteAlphaComponent = [UIColor whiteColor].byteAlpha;
    XCTAssertEqual( byteAlphaComponent, 255 );
    
    byteAlphaComponent = [UIColor redColor].byteAlpha;
    XCTAssertEqual( byteAlphaComponent, 255 );
    
    byteAlphaComponent = [UIColor greenColor].byteAlpha;
    XCTAssertEqual( byteAlphaComponent, 255 );
    
    byteAlphaComponent = [UIColor blueColor].byteAlpha;
    XCTAssertEqual( byteAlphaComponent, 255 );
    
    byteAlphaComponent = [UIColor colorWithWhite: 1.0f alpha: 0.0f].byteAlpha;
    XCTAssertEqual( byteAlphaComponent, 0 );
    
    byteAlphaComponent = [UIColor colorWithRed: 0.0f green: 1.0f blue: 1.0f alpha: 0.5f].byteAlpha;
    XCTAssertEqual( byteAlphaComponent, ( uint8_t )( 0.5f * 255 ) );
}

#pragma mark - luminance tests

-( void )test_luminance_returns_color_luminance
{
    CGFloat colorLuminance = [UIColor blackColor].luminance;
    XCTAssertEqual( colorLuminance, luminance( 0.0f, 0.0f, 0.0f ));
    
    colorLuminance = [UIColor whiteColor].luminance;
    XCTAssertEqual( colorLuminance, luminance( 1.0f, 1.0f, 1.0f ));
    
    colorLuminance = [UIColor redColor].luminance;
    XCTAssertEqual( colorLuminance, luminance( 1.0f, 0.0f, 0.0f ));
    
    colorLuminance = [UIColor greenColor].luminance;
    XCTAssertEqual( colorLuminance, luminance( 0.0f, 1.0f, 0.0f ));
    
    colorLuminance = [UIColor blueColor].luminance;
    XCTAssertEqual( colorLuminance, luminance( 0.0f, 0.0f, 1.0f ));
}

-( void )test_luminance_ignores_alpha_component
{
    CGFloat colorLuminance = [UIColor colorWithWhite: 1.0f alpha: 0.0f].luminance;
    XCTAssertEqual( colorLuminance, luminance( 1.0f, 1.0f, 1.0f ));
    
    colorLuminance = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].luminance;
    XCTAssertEqual( colorLuminance, luminance( 1.0f, 0.0f, 1.0f ));
}

#pragma mark - byteLuminance tests

-( void )test_byteLuminance_returns_color_byte_luminance
{
    uint8_t colorLuminance = [UIColor blackColor].byteLuminance;
    XCTAssertEqual( colorLuminance, luminancei( 0, 0, 0 ));
    
    colorLuminance = [UIColor whiteColor].byteLuminance;
    XCTAssertEqual( colorLuminance, luminancei( 255, 255, 255 ));
    
    colorLuminance = [UIColor redColor].byteLuminance;
    XCTAssertEqual( colorLuminance, luminancei( 255, 0, 0 ));
    
    colorLuminance = [UIColor greenColor].byteLuminance;
    XCTAssertEqual( colorLuminance, luminancei( 0, 255, 0 ));
    
    colorLuminance = [UIColor blueColor].byteLuminance;
    XCTAssertEqual( colorLuminance, luminancei( 0, 0, 255 ));
}

-( void )test_byteLuminance_ignores_alpha_component
{
    uint8_t colorLuminance = [UIColor colorWithWhite: 1.0f alpha: 0.0f].byteLuminance;
    XCTAssertEqual( colorLuminance, luminancei( 255, 255, 255 ));
    
    colorLuminance = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].byteLuminance;
    XCTAssertEqual( colorLuminance, luminancei( 255, 0.0f, 255 ));
}

#pragma mark - toRGBAHex tests

-( void )test_toRGBAHex_returns_color_RGBA_hex
{
    uint32_t rgbaHex = [UIColor blackColor].toRGBAHex;
    XCTAssertEqual( rgbaHex, 0x000000FF );
    
    rgbaHex = [UIColor whiteColor].toRGBAHex;
    XCTAssertEqual( rgbaHex, 0xFFFFFFFF );
    
    rgbaHex = [UIColor redColor].toRGBAHex;
    XCTAssertEqual( rgbaHex, 0xFF0000FF );
    
    rgbaHex = [UIColor greenColor].toRGBAHex;
    XCTAssertEqual( rgbaHex, 0x00FF00FF );
    
    rgbaHex = [UIColor blueColor].toRGBAHex;
    XCTAssertEqual( rgbaHex, 0x0000FFFF );
    
    rgbaHex = [UIColor colorWithWhite: 1.0f alpha: 0.0f].toRGBAHex;
    XCTAssertEqual( rgbaHex, 0xFFFFFF00 );
    
    rgbaHex = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].toRGBAHex;
    uint32_t byteAlpha = 0.5f * 255;
    XCTAssertEqual( rgbaHex, 0xFF00FF00 | ( uint32_t )byteAlpha );
}

#pragma mark - toARGBHex tests

-( void )test_toARGBHex_returns_color_ARGB_hex
{
    uint32_t argbHex = [UIColor blackColor].toARGBHex;
    XCTAssertEqual( argbHex, 0xFF000000 );
    
    argbHex = [UIColor whiteColor].toARGBHex;
    XCTAssertEqual( argbHex, 0xFFFFFFFF );
    
    argbHex = [UIColor redColor].toARGBHex;
    XCTAssertEqual( argbHex, 0xFFFF0000 );
    
    argbHex = [UIColor greenColor].toARGBHex;
    XCTAssertEqual( argbHex, 0xFF00FF00 );
    
    argbHex = [UIColor blueColor].toARGBHex;
    XCTAssertEqual( argbHex, 0xFF0000FF );
    
    argbHex = [UIColor colorWithWhite: 1.0f alpha: 0.0f].toARGBHex;
    XCTAssertEqual( argbHex, 0x00FFFFFF );
    
    argbHex = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].toARGBHex;
    uint32_t byteAlpha = (( uint32_t )( 0.5f * 255 )) << 24;
    XCTAssertEqual( argbHex, 0x00FF00FF | ( uint32_t )byteAlpha );
}

#pragma mark - toColorComponentsDictionary tests

-( void )test_toColorComponentsDictionary_returns_color_components_dictionary
{
    NSDictionary *colorComponentsDictionary = [UIColor blackColor].toColorComponentsDictionary;
    NSDictionary *expected = COLOR_COMPONENTS_DICT_WITH( 0.0f, 0.0f, 0.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor whiteColor].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 1.0f, 1.0f, 1.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor redColor].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 1.0f, 0.0f, 0.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor greenColor].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 0.0f, 1.0f, 0.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor blueColor].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 0.0f, 0.0f, 1.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor colorWithWhite: 1.0f alpha: 0.0f].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 1.0f, 1.0f, 1.0f, 0.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 1.0f, 0.0f, 1.0f, 0.5f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
}

#pragma mark - toColorByteComponentsDictionary tests

-( void )test_toColorByteComponentsDictionary_returns_byte_color_components_dictionary
{
    NSDictionary *colorComponentsDictionary = [UIColor blackColor].toColorByteComponentsDictionary;
    NSDictionary *expected = COLOR_COMPONENTS_DICT_WITH( 0, 0, 0, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor whiteColor].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 255, 255, 255, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor redColor].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 255, 0, 0, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor greenColor].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 0, 255, 0, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor blueColor].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 0, 0, 255, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor colorWithWhite: 1.0f alpha: 0].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 255, 255, 255, 0 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor colorWithRed: 1.0f green: 0 blue: 1.0f alpha: 0.5f].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_WITH( 255, 0, 255, ( uint8_t )( 0.5f * 255 ));
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
}

#pragma mark - toRGBHexString tests

-( void )test_toRGBHexString_returns_color_RGB_hex_string
{
    NSString *rgbHexString = [UIColor blackColor].toRGBHexString;
    XCTAssertEqualObjects( rgbHexString, @"0x000000" );
    
    rgbHexString = [UIColor whiteColor].toRGBHexString;
    XCTAssertEqualObjects( rgbHexString, @"0xFFFFFF" );
    
    rgbHexString = [UIColor redColor].toRGBHexString;
    XCTAssertEqualObjects( rgbHexString, @"0xFF0000" );
    
    rgbHexString = [UIColor greenColor].toRGBHexString;
    XCTAssertEqualObjects( rgbHexString, @"0x00FF00" );
    
    rgbHexString = [UIColor blueColor].toRGBHexString;
    XCTAssertEqualObjects( rgbHexString, @"0x0000FF" );
}

-( void )test_toRGBHexString_ignores_alpha_component
{
    NSString *rgbHexString = [UIColor colorWithWhite: 1.0f alpha: 0.0f].toRGBHexString;
    XCTAssertEqualObjects( rgbHexString, @"0xFFFFFF" );
    
    rgbHexString = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].toRGBHexString;
    XCTAssertEqualObjects( rgbHexString, @"0xFF00FF" );
}

#pragma mark - toRGBAHexString tests

-( void )test_toRGBAHexString_returns_color_RGBA_hex_string
{
    NSString *rgbaHexString = [UIColor blackColor].toRGBAHexString;
    XCTAssertEqualObjects( rgbaHexString, @"0x000000FF" );
    
    rgbaHexString = [UIColor whiteColor].toRGBAHexString;
    XCTAssertEqualObjects( rgbaHexString, @"0xFFFFFFFF" );
    
    rgbaHexString = [UIColor redColor].toRGBAHexString;
    XCTAssertEqualObjects( rgbaHexString, @"0xFF0000FF" );
    
    rgbaHexString = [UIColor greenColor].toRGBAHexString;
    XCTAssertEqualObjects( rgbaHexString, @"0x00FF00FF" );
    
    rgbaHexString = [UIColor blueColor].toRGBAHexString;
    XCTAssertEqualObjects( rgbaHexString, @"0x0000FFFF" );
    
    rgbaHexString = [UIColor colorWithWhite: 1.0f alpha: 0.0f].toRGBAHexString;
    XCTAssertEqualObjects( rgbaHexString, @"0xFFFFFF00" );
    
    rgbaHexString = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].toRGBAHexString;
    NSString *expected = [NSString stringWithFormat: @"0xFF00FF%02X", ( uint32_t )( 0.5f * 255 )];
    XCTAssertEqualObjects( rgbaHexString, expected );
}

#pragma mark - toARGBHexString tests





-( void )bla
{
UIColor *white = [UIColor whiteColor];
[white componentsAreEqualToComponentsOfColor: [UIColor colorWithByteRed: 255
                                                              byteGreen: 255
                                                               byteBlue: 255]]; // YES
    
[white componentsAreEqualToComponentsOfColor: [UIColor colorWithRed: 1.0f
                                                              green: 1.0f
                                                               blue: 1.0f
                                                              alpha: 1.0f]]; // YES
    
[white componentsAreEqualToComponentsOfColor: [UIColor colorWithWhite: 1.0f
                                                                alpha: 1.0f]]; // YES
    
[white componentsAreEqualToComponentsOfColor: [UIColor colorWithByteRed: 255
                                                              byteGreen: 255
                                                               byteBlue: 255
                                                              byteAlpha: 0]]; // NO
    
[white componentsAreEqualToComponentsOfColor: [UIColor colorWithWhite: 1.0f
                                                                alpha: 0.0f]]; // NO
// ...
}








-( void )test_toARGBHexString_returns_color_ARGB_hex_string
{
    NSString *argbHexString = [UIColor blackColor].toARGBHexString;
    XCTAssertEqualObjects( argbHexString, @"0xFF000000" );
    
    argbHexString = [UIColor whiteColor].toARGBHexString;
    XCTAssertEqualObjects( argbHexString, @"0xFFFFFFFF" );
    
    argbHexString = [UIColor redColor].toARGBHexString;
    XCTAssertEqualObjects( argbHexString, @"0xFFFF0000" );
    
    argbHexString = [UIColor greenColor].toARGBHexString;
    XCTAssertEqualObjects( argbHexString, @"0xFF00FF00" );
    
    argbHexString = [UIColor blueColor].toARGBHexString;
    XCTAssertEqualObjects( argbHexString, @"0xFF0000FF" );
    
    argbHexString = [UIColor colorWithWhite: 1.0f alpha: 0.0f].toARGBHexString;
    XCTAssertEqualObjects( argbHexString, @"0x00FFFFFF" );
    
    argbHexString = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].toARGBHexString;
    NSString *expected = [NSString stringWithFormat: @"0x%02XFF00FF", ( uint32_t )( 0.5f * 255 )];
    XCTAssertEqualObjects( argbHexString, expected );
}

#pragma mark - componentsAreEqualToComponentsOfColor: tests

-( void )test_colorComponentsAreEqualToColorComponentsOfColor_compares_color_components
{
    XCTAssertTrue( [[UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 0] componentsAreEqualToComponentsOfColor: [UIColor blackColor]] );
    XCTAssertTrue( [[UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 0 byteAlpha: 255] componentsAreEqualToComponentsOfColor: [UIColor blackColor]] );
    XCTAssertTrue( [[UIColor colorWithRed: 0.0f green: 0.0f blue: 0.0f alpha: 1.0f] componentsAreEqualToComponentsOfColor: [UIColor blackColor]] );
    XCTAssertTrue( [[UIColor colorWithWhite: 0.0f alpha: 1.0f] componentsAreEqualToComponentsOfColor: [UIColor blackColor]] );
    XCTAssertTrue( [[UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 0 byteAlpha: 0] componentsAreEqualToComponentsOfColor: [UIColor colorWithWhite: 0.0f alpha: 0.0f]] );
    XCTAssertTrue( [[UIColor colorWithRed: 0.0f green: 0.0f blue: 0.0f alpha: 0.5f] componentsAreEqualToComponentsOfColor: [UIColor colorWithWhite: 0.0f alpha: 0.5f]] );
    XCTAssertFalse( [[UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 0 byteAlpha: 0] componentsAreEqualToComponentsOfColor: [UIColor blackColor]] );
    XCTAssertFalse( [[UIColor colorWithWhite: 0.0f alpha: 0.0f] componentsAreEqualToComponentsOfColor: [UIColor blackColor]] );
    
    XCTAssertTrue( [[UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 255] componentsAreEqualToComponentsOfColor: [UIColor whiteColor]] );
    XCTAssertTrue( [[UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 255 byteAlpha: 255] componentsAreEqualToComponentsOfColor: [UIColor whiteColor]] );
    XCTAssertTrue( [[UIColor colorWithRed: 1.0f green: 1.0f blue: 1.0f alpha: 1.0f] componentsAreEqualToComponentsOfColor: [UIColor whiteColor]] );
    XCTAssertTrue( [[UIColor colorWithWhite: 1.0f alpha: 1.0f] componentsAreEqualToComponentsOfColor: [UIColor whiteColor]] );
    XCTAssertTrue( [[UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 255 byteAlpha: 0] componentsAreEqualToComponentsOfColor: [UIColor colorWithWhite: 1.0f alpha: 0.0f]] );
    XCTAssertTrue( [[UIColor colorWithRed: 1.0f green: 1.0f blue: 1.0f alpha: 0.7f] componentsAreEqualToComponentsOfColor: [UIColor colorWithWhite: 1.0f alpha: 0.7f]] );
    XCTAssertFalse( [[UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 255 byteAlpha: 0] componentsAreEqualToComponentsOfColor: [UIColor whiteColor]] );
    XCTAssertFalse( [[UIColor colorWithWhite: 1.0f alpha: 0.0f] componentsAreEqualToComponentsOfColor: [UIColor whiteColor]] );
    
    XCTAssertTrue( [[UIColor colorWithByteRed: 255 byteGreen: 0 byteBlue: 0] componentsAreEqualToComponentsOfColor: [UIColor redColor]] );
    XCTAssertTrue( [[UIColor colorWithByteRed: 255 byteGreen: 0 byteBlue: 0 byteAlpha: 255] componentsAreEqualToComponentsOfColor: [UIColor redColor]] );
    XCTAssertTrue( [[UIColor colorWithRed: 1.0f green: 0.0f blue: 0.0f alpha: 1.0f] componentsAreEqualToComponentsOfColor: [UIColor redColor]] );
    XCTAssertFalse( [[UIColor colorWithByteRed: 255 byteGreen: 0 byteBlue: 0 byteAlpha: 0] componentsAreEqualToComponentsOfColor: [UIColor redColor]] );
    
    XCTAssertTrue( [[UIColor colorWithByteRed: 0 byteGreen: 255 byteBlue: 0] componentsAreEqualToComponentsOfColor: [UIColor greenColor]] );
    XCTAssertTrue( [[UIColor colorWithByteRed: 0 byteGreen: 255 byteBlue: 0 byteAlpha: 255] componentsAreEqualToComponentsOfColor: [UIColor greenColor]] );
    XCTAssertTrue( [[UIColor colorWithRed: 0.0f green: 1.0f blue: 0.0f alpha: 1.0f] componentsAreEqualToComponentsOfColor: [UIColor greenColor]] );
    XCTAssertFalse( [[UIColor colorWithByteRed: 0 byteGreen: 255 byteBlue: 0 byteAlpha: 0] componentsAreEqualToComponentsOfColor: [UIColor greenColor]] );
    
    XCTAssertTrue( [[UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 255] componentsAreEqualToComponentsOfColor: [UIColor blueColor]] );
    XCTAssertTrue( [[UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 255 byteAlpha: 255] componentsAreEqualToComponentsOfColor: [UIColor blueColor]] );
    XCTAssertTrue( [[UIColor colorWithRed: 0.0f green: 0.0f blue: 1.0f alpha: 1.0f] componentsAreEqualToComponentsOfColor: [UIColor blueColor]] );
    XCTAssertFalse( [[UIColor colorWithByteRed: 0 byteGreen: 0 byteBlue: 255 byteAlpha: 0] componentsAreEqualToComponentsOfColor: [UIColor blueColor]] );
    
    XCTAssertTrue( [[UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 0] componentsAreEqualToComponentsOfColor: [UIColor yellowColor]] );
    XCTAssertTrue( [[UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 0 byteAlpha: 255] componentsAreEqualToComponentsOfColor: [UIColor yellowColor]] );
    XCTAssertTrue( [[UIColor colorWithRed: 1.0f green: 1.0f blue: 0.0f alpha: 1.0f] componentsAreEqualToComponentsOfColor: [UIColor yellowColor]] );
    XCTAssertFalse( [[UIColor colorWithByteRed: 255 byteGreen: 255 byteBlue: 0 byteAlpha: 0] componentsAreEqualToComponentsOfColor: [UIColor yellowColor]] );
}

@end
