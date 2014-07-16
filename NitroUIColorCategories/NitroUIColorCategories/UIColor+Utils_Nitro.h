//
//  UIColor+Utils_Nitro.h
//  NitroUIColorCategories
//
//  Created by Daniel L. Alves on 16/05/11.
//  Copyright (c) 2011 Daniel L. Alves. All rights reserved.
//

#import <UIKit/UIKit.h>

//
// Color Components Dictionary Keys
//
FOUNDATION_EXPORT NSString * const COLOR_DICT_COMPONENT_KEY_RED;
FOUNDATION_EXPORT NSString * const COLOR_DICT_COMPONENT_KEY_GREEN;
FOUNDATION_EXPORT NSString * const COLOR_DICT_COMPONENT_KEY_BLUE;
FOUNDATION_EXPORT NSString * const COLOR_DICT_COMPONENT_KEY_ALPHA;

#ifndef ARGB_TO_HEX
/**
 *  Macro to help build an ARGB hexadecimal color represented as an uint32_t
 *
 *  @param alpha The alpha component of the color. Must be an uint8_t value in the interval [0, 255]
 *  @param red   The red component of the color. Must be an uint8_t value in the interval [0, 255]
 *  @param green The green component of the color. Must be an uint8_t value in the interval [0, 255]
 *  @param blue  The blue component of the color. Must be an uint8_t value in the interval [0, 255]
 *
 *  @return The hexadecimal ARGB color uint32_t representation
 */
#define ARGB_TO_HEX( alpha, red, green, blue ) ( (( ( uint8_t )alpha & 0xFF ) << 24 ) \
											   | (( ( uint8_t )red   & 0xFF ) << 16 ) \
											   | (( ( uint8_t )green & 0xFF ) <<  8 ) \
											   |  ( ( uint8_t )blue  & 0xFF ))

#endif

#ifndef RGBA_TO_HEX
/**
 *  Macro to help build an RGBA hexadecimal color represented as an uint32_t
 *
 *  @param red   The red component of the color. Must be an uint8_t value in the interval [0, 255]
 *  @param green The green component of the color. Must be an uint8_t value in the interval [0, 255]
 *  @param blue  The blue component of the color. Must be an uint8_t value in the interval [0, 255]
 *  @param alpha The alpha component of the color. Must be an uint8_t value in the interval [0, 255]
 *
 *  @return The hexadecimal RGBA color uint32_t representation
 */
#define RGBA_TO_HEX( red, green, blue, alpha ) ( (( ( uint8_t )red   & 0xFF ) << 24 ) \
											   | (( ( uint8_t )green & 0xFF ) << 16 ) \
											   | (( ( uint8_t )blue  & 0xFF ) <<  8 ) \
											   |  ( ( uint8_t )alpha & 0xFF ))
#endif

/**
 *  Initialization, conversion, RGBA component getters and luminance utilities for iOS UIColor type
 */
@interface UIColor( Utils_Nitro )

/*********************************
 *
 * Constructors
 *
 ********************************/

/**
*  Creates a new UIColor object with the specified color components. The alpha
*  component will be equal to 255
*
*  @param r The red component of the color in the interval [0, 255].
*  @param g The green component of the color in the interval [0, 255].
*  @param b The blue component of the color in the interval [0, 255].
*
*  @return A new UIColor object with the specified color components.
*/
+( UIColor * )colorWithByteRed:( uint8_t )r byteGreen:( uint8_t )g byteBlue:( uint8_t )b;

/**
 *  Creates a new UIColor object with the specified color components.
 *
 *  @param r The red component of the color in the interval [0, 255].
 *  @param g The green component of the color in the interval [0, 255].
 *  @param b The blue component of the color in the interval [0, 255].
 *  @param a The alpha component of the color in the interval [0, 255].
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorWithByteRed:( uint8_t )r byteGreen:( uint8_t )g byteBlue:( uint8_t )b byteAlpha:( uint8_t )a;

/**
 *  Creates a new UIColor object with the specified color components. The alpha
 *  component will be equal to 1.0.
 *
 *  @param rgb A number which hexadecimal value represents the color in the format RRGGBB. The most significant 
 *             byte is ignored and the color will be fully opaque.
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorFromRGBHex:( uint32_t )rgb;

/**
 *  Creates a new UIColor object with the specified color components.
 *
 *  @param rgba A number which hexadecimal value represents the color in the format RRGGBBAA.
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorFromRGBAHex:( uint32_t )rgba;

/**
 *  Creates a new UIColor object with the specified color components.
 *
 *  @param argb A number which hexadecimal value represents the color in the format AARRGGBB.
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorFromARGBHex:( uint32_t )argb;

/**
 *  Creates a new UIColor object with the specified color components. The color will
 *  be fully opaque.
 *
 *  @param rgbStr A string with the format 0xRRGGBB representing the color hexadecimal number.
 *                The prefix '0x' is not necessary. So @"0xFF0000" is the same as @"FF0000".
 *                If you pass a string with the format 0xAARRGGBB, the alpha part will be ignored
 *                and the color will be fully opaque.
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorFromRGBHexString:( NSString * )rgbStr;

/**
 *  Creates a new UIColor object with the specified color components.
 *
 *  @param rgbaStr A string with the format 0xRRGGBBAA representing the color hexadecimal number.
 *                 The prefix '0x' is not necessary. So @"0xFF0000FF" is the same as @"FF0000FF".
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorFromRGBAHexString:( NSString * )rgbaStr;

/**
 *  Creates a new UIColor object with the specified color components.
 *
 *  @param argbStr A string with the format 0xAARRGGBB representing the color hexadecimal number.
 *                 The prefix '0x' is not necessary. So @"0xFFFF0000" is the same as @"FFFF0000".
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorFromARGBHexString:( NSString * )argbStr;

/**
 *  Creates a new UIColor object with the specified color components.
 *  Values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
 *  Missing components will be set as 0.0.
 *
 *  @param colorDict A dictionary containing one key for each color component. All values must be of float type
 *                   in the range [0.0, 1.0]. The components must be indexed with the constants COLOR_DICT_COMPONENT_KEY_RED,
 *                   COLOR_DICT_COMPONENT_KEY_GREEN, COLOR_DICT_COMPONENT_KEY_BLUE and COLOR_DICT_COMPONENT_KEY_ALPHA.
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorFromColorComponentsDictionary:( NSDictionary * )colorDict;

/**
 *  Creates a new UIColor object with the specified color components.
 *  Values below 0 are interpreted as 0, and values above 255 are interpreted as 255.
 *  Missing components will be set as 0.
 *
 *  @param colorDict A dictionary containing one key for each color component. All values must be of uint8_t type
 *                   in the range [0, 255]. The components must be indexed with the constants COLOR_DICT_COMPONENT_KEY_RED,
 *                   COLOR_DICT_COMPONENT_KEY_GREEN, COLOR_DICT_COMPONENT_KEY_BLUE and COLOR_DICT_COMPONENT_KEY_ALPHA.
 *
 *  @return A new UIColor object with the specified color components.
 */
+( UIColor * )colorFromColorByteComponentsDictionary:( NSDictionary * )colorDict;

/*********************************
 *
 * Component getters
 *
 ********************************/

/**
 *  Returns the red component of the color as a float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it 
 *  was a getter. Example:
 *
 *  CGFloat r = color.red;
 *
 *  @return The red component of the color.
 */
-( CGFloat )red;

/**
 *  Returns the green component of the color as a float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  CGFloat g = color.green;
 *
 *  @return The green component of the color.
 */
-( CGFloat )green;

/**
 *  Returns the blue component of the color as a float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  CGFloat b = color.blue;
 *
 *  @return The blue component of the color.
 */
-( CGFloat )blue;

/**
 *  Returns the alpha component of the color as a float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  CGFloat a = color.alpha;
 *
 *  @return The alpha component of the color.
 */
-( CGFloat )alpha;

/**
 *  Returns the red component of the color as an uint8_t in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t r = color.byteRed;
 *
 *  @return The red component of the color.
 */
-( uint8_t )byteRed;

/**
 *  Returns the green component of the color as an uint8_t value in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t g = color.byteGreen;
 *
 *  @return The green component of the color.
 */
-( uint8_t )byteGreen;

/**
 *  Returns the blue component of the color as an uint8_t value in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t b = color.byteBlue;
 *
 *  @return The blue component of the color.
 */
-( uint8_t )byteBlue;

/**
 *  Returns the alpha component of the color as an uint8_t value in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t a = color.byteAlpha;
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
 *  The luminance of the color as a float value in the interval [0.0, 1.0].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  CGFloat luminance = color.luminance;
 *
 *  @return The luminance of the color.
 */
-( CGFloat )luminance;

/**
 *  The luminance of the color as an uint8_t value in the interval [0, 255].
 *  Since this method does not receive parameters, it is possible to call it as if it
 *  was a getter. Example:
 *
 *  uint8_t luminance = color.byteLuminance;
 *
 *  @return The luminance of the color.
 */
-( uint8_t )byteLuminance;

/*********************************
 *
 * Conversion
 *
 ********************************/

/**
 *  Returns an RGBA hexadecimal color represented as an uint32_t.
 *
 *  @return An RGBA hexadecimal color represented as an uint32_t.
 */
-( uint32_t )toRGBAHex;

/**
 *  Returns an ARGB hexadecimal color represented as an uint32_t.
 *
 *  @return An ARGB hexadecimal color represented as an uint32_t.
 */
-( uint32_t )toARGBHex;

/**
 *  Returns a dictionary containing one key for each RGBA component of the color.
 *  All components are float values in the interval [0.0, 1.0].
 *  For indexing the dictionary, use the constants:
 *      - COLOR_DICT_COMPONENT_KEY_RED
 *      - COLOR_DICT_COMPONENT_KEY_GREEN
 *      - COLOR_DICT_COMPONENT_KEY_BLUE
 *      - COLOR_DICT_COMPONENT_KEY_ALPHA
 *
 *  @return A dictionary containing one key for each RGBA component of the color.
 */
-( NSDictionary * )toColorComponentsDictionary;

/**
 *  Returns a dictionary containing one key for each RGBA component of the color.
 *  All components are uint8_t values in the interval [0, 255].
 *  For indexing the dictionary, use the constants:
 *      - COLOR_DICT_COMPONENT_KEY_RED
 *      - COLOR_DICT_COMPONENT_KEY_GREEN
 *      - COLOR_DICT_COMPONENT_KEY_BLUE
 *      - COLOR_DICT_COMPONENT_KEY_ALPHA
 *
 *  @return A dictionary containing one key for each RGBA component of the color.
 */
-( NSDictionary * )toColorByteComponentsDictionary;

/**
 *  Returns a string with the format 0xRRGGBB, where:
 *      - RR is the red component hexadecimal representation
 *      - GG is the green component hexadecimal representation
 *      - BB is the blue component hexadecimal representation
 *
 *  @return A string with the format 0xRRGGBB
 */
-( NSString * )toRGBHexString;

/**
 *  Returns a string with the format 0xRRGGBBAA, where:
 *      - RR is the red component hexadecimal representation
 *      - GG is the green component hexadecimal representation
 *      - BB is the blue component hexadecimal representation
 *      - AA is the alpha component hexadecimal representation
 *
 *  @return A string with the format 0xRRGGBBAA.
 */
-( NSString * )toRGBAHexString;

/**
 *  Returns a string with the format 0xAARRGGBB, where:
 *      - AA is the alpha component hexadecimal representation
 *      - RR is the red component hexadecimal representation
 *      - GG is the green component hexadecimal representation
 *      - BB is the blue component hexadecimal representation
 *
 *  @return A string with the format 0xAARRGGBB.
 */
-( NSString * )toARGBHexString;

/*********************************
 *
 * Comparison
 *
 ********************************/

/**
 *  Returns if the color components of each color are equal
 *
 *  @param other To color whose color components will be compared
 *               to this color components.
 *
 *  @return YES if all components are equal. NO otherwise.
 */
-( BOOL )componentsAreEqualToComponentsOfColor:( UIColor * )other;

@end
