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

/*********************************
 *
 * Component getters
 *
 ********************************/

/**
 *  Returns the red component of the color as float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it 
 *  was a getter. Example:
 *
 *  CGFloat r = color.red;
 *
 *  @return The red component of the color.
 */
-( CGFloat )red;

/**
 *  Returns the green component of the color as float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  CGFloat g = color.green;
 *
 *  @return The green component of the color.
 */
-( CGFloat )green;

/**
 *  Returns the blue component of the color as float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  CGFloat b = color.blue;
 *
 *  @return The blue component of the color.
 */
-( CGFloat )blue;

/**
 *  Returns the alpha component of the color as float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  CGFloat a = color.alpha;
 *
 *  @return The alpha component of the color.
 */
-( CGFloat )alpha;

/**
 *  Returns the red component of the color as float uint8_t in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t r = color.red;
 *
 *  @return The red component of the color.
 */
-( uint8_t )byteRed;

/**
 *  Returns the green component of the color as uint8_t value in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t g = color.green;
 *
 *  @return The green component of the color.
 */
-( uint8_t )byteGreen;

/**
 *  Returns the blue component of the color as uint8_t value in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t b = color.blue;
 *
 *  @return The blue component of the color.
 */
-( uint8_t )byteBlue;

/**
 *  Returns the alpha component of the color as uint8_t value in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t a = color.alpha;
 *
 *  @return The alpha component of the color.
 */
-( uint8_t )byteAlpha;

/*********************************
 *
 * Luminance
 *
 ********************************/

/**
 *  The luminance of the color as float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  CGFloat luminance = color.luminance;
 *
 *  @return The luminance of the color.
 */
-( CGFloat )luminance;

/**
 *  The luminance of the color as uint8_t value in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t luminance = color.luminance;
 *
 *  @return The luminance of the color.
 */
-( uint8_t )byteLuminance;

// Conversion
-( NSDictionary * )toColorDictionary;
-( NSDictionary * )toColorByteComponentsDictionary;

-( NSString * )toRGBHexString;
-( NSString * )toRGBAHexString;
-( NSString * )toARGBHexString;

@end
