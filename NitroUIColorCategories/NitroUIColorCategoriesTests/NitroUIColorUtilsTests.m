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

#define COLOR_COMPONENTS_DICT_FOR( red, green, blue, alpha ) \
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
    XCTAssertEqual( colorLuminance, luminance( 0.0f, 1.0f, 0.0f ) );
    
    colorLuminance = [UIColor blueColor].luminance;
    XCTAssertEqual( colorLuminance, luminance( 0.0f, 0.0f, 1.0f ) );
}

-( void )test_luminance_ignores_alpha_component
{
    CGFloat colorLuminance = [UIColor colorWithWhite: 1.0f alpha: 0.0f].luminance;
    XCTAssertEqual( colorLuminance, luminance( 1.0f, 1.0f, 1.0f ));
    
    colorLuminance = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].luminance;
    XCTAssertEqual( colorLuminance, luminance( 1.0f, 0.0f, 1.0f ));
}

#pragma mark - byteLuminance tests

-( void )test_byteLuminance_returns_color_luminance
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
    NSDictionary *expected = COLOR_COMPONENTS_DICT_FOR( 0.0f, 0.0f, 0.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor whiteColor].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 1.0f, 1.0f, 1.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor redColor].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 1.0f, 0.0f, 0.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor greenColor].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 0.0f, 1.0f, 0.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor blueColor].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 0.0f, 0.0f, 1.0f, 1.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor colorWithWhite: 1.0f alpha: 0.0f].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 1.0f, 1.0f, 1.0f, 0.0f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor colorWithRed: 1.0f green: 0.0f blue: 1.0f alpha: 0.5f].toColorComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 1.0f, 0.0f, 1.0f, 0.5f );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
}

#pragma mark - toColorByteComponentsDictionary tests

-( void )test_toColorByteComponentsDictionary_returns_byte_color_components_dictionary
{
    NSDictionary *colorComponentsDictionary = [UIColor blackColor].toColorByteComponentsDictionary;
    NSDictionary *expected = COLOR_COMPONENTS_DICT_FOR( 0, 0, 0, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor whiteColor].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 255, 255, 255, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor redColor].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 255, 0, 0, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor greenColor].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 0, 255, 0, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor blueColor].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 0, 0, 255, 255 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor colorWithWhite: 1.0f alpha: 0].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 255, 255, 255, 0 );
    XCTAssertEqualObjects( colorComponentsDictionary, expected );
    
    colorComponentsDictionary = [UIColor colorWithRed: 1.0f green: 0 blue: 1.0f alpha: 0.5f].toColorByteComponentsDictionary;
    expected = COLOR_COMPONENTS_DICT_FOR( 255, 0, 255, ( uint8_t )( 0.5f * 255 ));
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

-( void )test_toARGBHexString_returns_color_RGBA_hex_string
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

@end
