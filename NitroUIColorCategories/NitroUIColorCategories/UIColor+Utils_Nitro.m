//
//  UIColor+Utils_Nitro.m
//  NitroUIColorCategories
//
//  Created by Daniel L. Alves on 16/05/11.
//  Copyright (c) 2011 Daniel L. Alves. All rights reserved.
//

#import "UIColor+Utils_Nitro.h"

// pods
#import <NitroMath/NTRMath.h>
#import <NitroNSDictionaryCategories/NSDictionary+Parsing_Nitro.h>

#pragma mark - Defines

#define RED_COMPONENT_INDEX		0
#define GREEN_COMPONENT_INDEX	1
#define BLUE_COMPONENT_INDEX	2
#define ALPHA_COMPONENT_INDEX	3

#define WA_WHITE_COMPONENT_INDEX	0
#define WA_ALPHA_COMPONENT_INDEX	1

#pragma mark - Constants

NSString * const COLOR_DICT_COMPONENT_KEY_RED    = @"r";
NSString * const COLOR_DICT_COMPONENT_KEY_GREEN  = @"g";
NSString * const COLOR_DICT_COMPONENT_KEY_BLUE   = @"b";
NSString * const COLOR_DICT_COMPONENT_KEY_ALPHA  = @"a";

#pragma mark - Implementation

@implementation UIColor( Utils_Nitro )

#pragma mark - Constructors

+( UIColor * )colorWithByteRed:( uint8_t )r byteGreen:( uint8_t )g byteBlue:( uint8_t )b
{
    return [UIColor colorWithByteRed: r byteGreen: g byteBlue: b byteAlpha: 255];
}

+( UIColor * )colorWithByteRed:( uint8_t )r byteGreen:( uint8_t )g byteBlue:( uint8_t )b byteAlpha:( uint8_t )a
{
    return [UIColor colorWithRed: ( CGFloat )r / 255.0f
                           green: ( CGFloat )g / 255.0f
                            blue: ( CGFloat )b / 255.0f
                           alpha: ( CGFloat )a / 255.0f];
}

+( UIColor * )colorFromRGBHex:( uint32_t )rgb
{
	return [self colorFromARGBHex: rgb | 0xFF000000];
}

+( UIColor * )colorFromRGBAHex:( uint32_t )rgba
{
	uint8_t r = ( rgba & 0xFF000000 ) >> 24;
	uint8_t g = ( rgba & 0x00FF0000 ) >> 16;
	uint8_t b = ( rgba & 0x0000FF00 ) >>  8;
	uint8_t a = ( rgba & 0x000000FF );
	
	return [self colorWithByteRed: r byteGreen: g byteBlue: b byteAlpha: a];
}

+( UIColor * )colorFromARGBHex:( uint32_t )argb
{
	uint8_t a = ( argb & 0xFF000000 ) >> 24;
	uint8_t r = ( argb & 0x00FF0000 ) >> 16;
	uint8_t g = ( argb & 0x0000FF00 ) >>  8;
	uint8_t b = ( argb & 0x000000FF );
	
	return [self colorWithByteRed: r byteGreen: g byteBlue: b byteAlpha: a];
}

+( UIColor * )colorFromRGBHexString:( NSString * )rgbStr
{
    if( [rgbStr length] == 0 )
		return nil;
    
    uint32_t argb = [self parseColorFromString: rgbStr];
    return [UIColor colorFromARGBHex: argb | 0xFF000000];
}

+( UIColor * )colorFromRGBAHexString:( NSString * )rgbaStr
{
    if( [rgbaStr length] == 0 )
		return nil;
    
    uint32_t rgba = [self parseColorFromString: rgbaStr];
    return [UIColor colorFromRGBAHex: rgba];
}

+( UIColor * )colorFromARGBHexString:( NSString * )argbStr
{
    if( [argbStr length] == 0 )
		return nil;
    
    uint32_t argb = [self parseColorFromString: argbStr];
    return [UIColor colorFromARGBHex: argb];
}

+( UIColor * )colorFromColorComponentsDictionary:( NSDictionary * )colorDict
{
    CGFloat r = clamp( [[colorDict numberForKey: COLOR_DICT_COMPONENT_KEY_RED] floatValue], 0.0f, 1.0f );
    CGFloat g = clamp( [[colorDict numberForKey: COLOR_DICT_COMPONENT_KEY_GREEN] floatValue], 0.0f, 1.0f );
    CGFloat b = clamp( [[colorDict numberForKey: COLOR_DICT_COMPONENT_KEY_BLUE] floatValue], 0.0f, 1.0f );
    CGFloat a = clamp( [[colorDict numberForKey: COLOR_DICT_COMPONENT_KEY_ALPHA] floatValue], 0.0f, 1.0f );
    return [self colorWithRed: r green: g blue: b alpha: a];
}

+( UIColor * )colorFromColorByteComponentsDictionary:( NSDictionary * )colorDict
{
    uint8_t r = clampi( [[colorDict numberForKey: COLOR_DICT_COMPONENT_KEY_RED] intValue], 0, 255 );
    uint8_t g = clampi( [[colorDict numberForKey: COLOR_DICT_COMPONENT_KEY_GREEN] intValue], 0, 255 );
    uint8_t b = clampi( [[colorDict numberForKey: COLOR_DICT_COMPONENT_KEY_BLUE] intValue], 0, 255 );
    uint8_t a = clampi( [[colorDict numberForKey: COLOR_DICT_COMPONENT_KEY_ALPHA] intValue], 0, 255 );
    return [self colorWithByteRed: r byteGreen: g byteBlue: b byteAlpha: a];
}

#pragma mark - UIColor Components Getters

-( CGFloat )red
{
	return [self getComponent: RED_COMPONENT_INDEX];
}

-( CGFloat )green
{
	return [self getComponent: GREEN_COMPONENT_INDEX];
}

-( CGFloat )blue
{
	return [self getComponent: BLUE_COMPONENT_INDEX];
}

-( CGFloat )alpha
{
	return [self getComponent: ALPHA_COMPONENT_INDEX];
}

-( uint8_t )byteRed
{
	return ( uint8_t )( 255.0f * [self red] );
}

-( uint8_t )byteGreen
{
	return ( uint8_t )( 255.0f * [self green] );
}

-( uint8_t )byteBlue
{
	return ( uint8_t )( 255.0f * [self blue] );
}

-( uint8_t )byteAlpha
{
	return ( uint8_t )( 255.0f * [self alpha] );
}

#pragma mark - Luminance

-( CGFloat )luminance
{
    return luminance( self.red, self.green, self.blue );
}

-( uint8_t )byteLuminance
{
    return luminancei( self.byteRed, self.byteGreen, self.byteBlue );
}

#pragma mark - Conversion

-( uint32_t )toRGBAHex
{
    return RGBA_TO_HEX( self.byteRed, self.byteGreen, self.byteBlue, self.byteAlpha );
}

-( uint32_t )toARGBHex
{
    return ARGB_TO_HEX( self.byteAlpha, self.byteRed, self.byteGreen, self.byteBlue );
}

-( NSDictionary * )toColorComponentsDictionary
{
    return @{
        COLOR_DICT_COMPONENT_KEY_RED: @( self.red ),
        COLOR_DICT_COMPONENT_KEY_GREEN: @( self.green ),
        COLOR_DICT_COMPONENT_KEY_BLUE: @( self.blue ),
        COLOR_DICT_COMPONENT_KEY_ALPHA: @( self.alpha ),
    };
}

-( NSDictionary * )toColorByteComponentsDictionary
{
    return @{
        COLOR_DICT_COMPONENT_KEY_RED: @( self.byteRed ),
        COLOR_DICT_COMPONENT_KEY_GREEN: @( self.byteGreen ),
        COLOR_DICT_COMPONENT_KEY_BLUE: @( self.byteBlue ),
        COLOR_DICT_COMPONENT_KEY_ALPHA: @( self.byteAlpha ),
    };
}

-( NSString * )toRGBHexString
{
    return [NSString stringWithFormat: @"0x%02X%02X%02X", self.byteRed, self.byteGreen, self.byteBlue];
}

-( NSString * )toRGBAHexString
{
    return [NSString stringWithFormat: @"0x%08X", self.toRGBAHex];
}

-( NSString * )toARGBHexString
{
    return [NSString stringWithFormat: @"0x%08X", self.toARGBHex];
}

#pragma mark - Comparison

-( BOOL )componentsAreEqualToComponentsOfColor:( UIColor * )other
{
    return self.byteRed == other.byteRed
           && self.byteGreen == other.byteGreen
           && self.byteBlue == other.byteBlue
           && self.byteAlpha == other.byteAlpha;
}

#pragma mark - Helpers

-( CGFloat )getComponent:( uint8_t ) index
{
	CGColorRef temp = self.CGColor;

	// White ; Alpha
	if( CGColorGetNumberOfComponents( temp ) == 2 )
		return CGColorGetComponents( temp )[ ( index == ALPHA_COMPONENT_INDEX ? WA_ALPHA_COMPONENT_INDEX : WA_WHITE_COMPONENT_INDEX ) ];

	// RGBA
    return CGColorGetComponents( temp )[ index ];
}

+( uint32_t )parseColorFromString:( NSString * )str
{
#define HEX_STR_MAX_CHARS 8
	uint8_t nHexChars = 0;
	char onlyValidHexChars[ HEX_STR_MAX_CHARS ];
	
	const char *temp = [[str stringByReplacingOccurrencesOfString: @"0x" withString: @""] UTF8String];
	while( (( *temp ) != 0 ) && ( nHexChars < HEX_STR_MAX_CHARS ) )
	{
		if( [UIColor isValidHexChar: *temp] )
			onlyValidHexChars[ nHexChars++ ] = *temp;
		
		++temp;
	}
	
	if( ( nHexChars & 1 ) != 0 )
		return 0;
	
	uint32_t colorComponentsHex = 0xFFFFFFFF;
	uint8_t *iterator = ( uint8_t * )&colorComponentsHex;
	
	while( nHexChars > 0 )
	{
		( *iterator ) = ( [UIColor hexCharToByte: onlyValidHexChars[nHexChars - 2]] * 16 ) + [UIColor hexCharToByte: onlyValidHexChars[nHexChars - 1]];
		++iterator;
		
		nHexChars -= 2;
	}
	
	return colorComponentsHex;
	
#undef HEX_STR_MAX_CHARS
}

+( BOOL )isValidHexChar:( char )c
{
	return ( c >= '0' && c <= '9' ) || ( c >= 'A' && c <= 'F' ) || ( c >= 'a' && c <= 'f' );
}

+( uint8_t )hexCharToByte:( char )c
{
	if( c >= '0' && c <= '9' )
		return ( uint8_t )( c - '0' );
	else if( c >= 'A' && c <= 'F' )
		return ( uint8_t )( 10 + c - 'A' );
	else if( c >= 'a' && c <= 'f' )
		return ( uint8_t )( 10 + c - 'a' );
	
	@throw [NSException exceptionWithName: NSInvalidArgumentException 
								   reason: [NSString stringWithFormat: @"Character %c is not a valid hex char", c] 
								 userInfo: nil];
}

@end
