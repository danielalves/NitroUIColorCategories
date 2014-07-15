//
//  UIColor+Utils_Nitro.h
//  NitroUIColorCategories
//
//  Created by Daniel L. Alves on 16/05/11.
//  Copyright (c) 2011 Daniel L. Alves. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString * const COLOR_DICT_COMPONENT_KEY_RED;
FOUNDATION_EXPORT NSString * const COLOR_DICT_COMPONENT_KEY_GREEN;
FOUNDATION_EXPORT NSString * const COLOR_DICT_COMPONENT_KEY_BLUE;
FOUNDATION_EXPORT NSString * const COLOR_DICT_COMPONENT_KEY_ALPHA;

#ifndef ARGB_TO_HEX
#define ARGB_TO_HEX( alpha, red, green, blue ) ( (( ( uint8_t )alpha & 0xFF ) << 24 ) \
											   | (( ( uint8_t )red   & 0xFF ) << 16 ) \
											   | (( ( uint8_t )green & 0xFF ) <<  8 ) \
											   |  ( ( uint8_t )blue  & 0xFF ))

#endif

#ifndef RGBA_TO_HEX
#define RGBA_TO_HEX( red, green, blue, alpha ) ( (( ( uint8_t )red   & 0xFF ) << 24 ) \
											   | (( ( uint8_t )green & 0xFF ) << 16 ) \
											   | (( ( uint8_t )blue  & 0xFF ) <<  8 ) \
											   |  ( ( uint8_t )alpha & 0xFF ))
#endif

@interface UIColor( Utils_Nitro )

// Constructors
+( UIColor * )colorWithByteRed:( uint8_t )r byteGreen:( uint8_t )g byteBlue:( uint8_t )b;
+( UIColor * )colorWithByteRed:( uint8_t )r byteGreen:( uint8_t )g byteBlue:( uint8_t )b byteAlpha:( uint8_t )a;

+( UIColor * )colorFromDictionary:( NSDictionary * )colorDict;

+( UIColor * )colorFromRGBHex:( uint32_t )rgb;
+( UIColor * )colorFromRGBAHex:( uint32_t )rgba;
+( UIColor * )colorFromARGBHex:( uint32_t )argb;

+( UIColor * )colorWithRGBHexString:( NSString * )rgbStr;
+( UIColor * )colorWithRGBAHexString:( NSString * )rgbaStr;
+( UIColor * )colorWithARGBHexString:( NSString * )argbStr;

// Component getters
-( CGFloat )red;
-( CGFloat )green;
-( CGFloat )blue;
-( CGFloat )alpha;

-( uint8_t )byteRed;
-( uint8_t )byteGreen;
-( uint8_t )byteBlue;
-( uint8_t )byteAlpha;

// Luminance
-( CGFloat )luminance;
-( uint8_t )byteLuminance;

// Conversion
-( NSDictionary * )toColorDictionary;
-( NSDictionary * )toColorByteComponentsDictionary;

-( NSString * )toRGBHexString;
-( NSString * )toRGBAHexString;
-( NSString * )toARGBHexString;

@end
