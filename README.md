NitroUIColorCategories
======================
[![Cocoapods](https://cocoapod-badges.herokuapp.com/v/NitroUIColorCategories/badge.png)](http://cocoapods.org/?q=NitroUIColorCategories)
[![Platform](http://cocoapod-badges.herokuapp.com/p/NitroUIColorCategories/badge.png)](http://cocoadocs.org/docsets/NitroUIColorCategories)
[![TravisCI](https://travis-ci.org/danielalves/NitroUIColorCategories.svg?branch=master)](https://travis-ci.org/danielalves/NitroUIColorCategories)

**NitroUIColorCategories** offers initialization, conversion, comparison, RGBA components and luminance getters for iOS `UIColor` type.

Examples
--------

**1) Initialization**
```objc
UIColor *opaqueRed = [UIColor colorWithByteRed: 255
                                     byteGreen: 0
                                      byteBlue: 0];
    
UIColor *semiTransparentRed = [UIColor colorWithByteRed: 255
                                              byteGreen: 0
                                               byteBlue: 0
                                              byteAlpha: 128];
    
// With hexadecimal numbers
UIColor *opaqueBlue = [UIColor colorFromRGBHex: 0x0000FF];
UIColor *semiTransparentBlue = [UIColor colorFromRGBAHex: 0x0000FF80];
UIColor *blueWithAlphaFirst = [UIColor colorFromARGBHex: 0xFF0000FF];
    
// With hexadecimal strings
UIColor *opaqueGreen = [UIColor colorFromRGBHexString: @"0x00FF00"];
UIColor *semiTransparentGreen = [UIColor colorFromRGBAHexString: @"0x00FF0080"];
UIColor *greenWithAlphaFirst = [UIColor colorFromARGBHexString: @"0xFF00FF00"];
    
// ... which don't really need the '0x' prefix
UIColor *opaqueMagenta = [UIColor colorFromRGBHexString: @"FF00FF"];
UIColor *semiTransparentMagenta = [UIColor colorFromRGBAHexString: @"FF00FF80"];
UIColor *magentaWithAlphaFirst = [UIColor colorFromARGBHexString: @"FFFF00FF"];
    
// With dictionaries (Ruby? Anyone?)
UIColor *opaqueCyanWithFloats = [UIColor colorFromColorComponentsDictionary: @{
    COLOR_DICT_COMPONENT_KEY_GREEN: @( 1.0f ),
    COLOR_DICT_COMPONENT_KEY_BLUE: @( 1.0f ),
    COLOR_DICT_COMPONENT_KEY_ALPHA: @( 1.0f )
}];
    
UIColor *transparentYellowWithBytes = [UIColor colorFromColorByteComponentsDictionary: @{
    COLOR_DICT_COMPONENT_KEY_RED: @( 255 ),
    COLOR_DICT_COMPONENT_KEY_GREEN: @( 255 )
}];
```

**2) Conversion**

```objc
// To hexadecimal numbers
UIColor *red = [UIColor redColor];
uint32_t rgba = red.toRGBAHex; // Will be 0xFF0000FF
uint32_t argb = red.toARGBHex; // Will be 0xFFFF0000

// To hexadecimal strings
UIColor *blue = [UIColor blueColor];
NSString *rgbString = blue.toRGBHexString;   // Will be @"0x0000FF"
NSString *argbString = blue.toARGBHexString; // Will be @"0xFF0000FF"
NSString *rgbaString = blue.toRGBAHexString; // Will be @"0x0000FFFF"
    
// To dictionaries
UIColor *transparentWhite = [UIColor colorWithWhite: 1.0f alpha: 0.0f];

// Will be @{ COLOR_DICT_COMPONENT_KEY_RED: @( 1.0f ),
//            COLOR_DICT_COMPONENT_KEY_GREEN: @( 1.0f ),
//            COLOR_DICT_COMPONENT_KEY_BLUE: @( 1.0f ),
//            COLOR_DICT_COMPONENT_KEY_ALPHA: @( 0.0f ) }
NSDictionary *components = transparentWhite.toColorComponentsDictionary;

// Will be @{ COLOR_DICT_COMPONENT_KEY_RED: @( 255 ),
//            COLOR_DICT_COMPONENT_KEY_GREEN: @( 255 ),
//            COLOR_DICT_COMPONENT_KEY_BLUE: @( 255 ),
//            COLOR_DICT_COMPONENT_KEY_ALPHA: @( 0 ) }
NSDictionary *byteComponents = transparentWhite.toColorByteComponentsDictionary;
```

**3) Comparison**

```objc
// Compare colors by their components
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
```

**4) RGBA components getters**

```objc
// Get the color red component as byte or float
UIColor *color = /* Any color */;
CGFloat redComponent = color.red;
uint8_t byteRedComponent = color.byteRed;
    
// Get the color green component as byte or float
CGFloat greenComponent = color.green;
uint8_t byteGreenComponent = color.byteGreen;
    
// Get the color blue component as byte or float
CGFloat blueComponent = color.blue;
uint8_t byteBlueComponent = color.byteBlue;
    
// Get the color alpha component as byte or float
CGFloat alphaComponent = color.alpha;
uint8_t byteAlphaComponent = color.byteAlpha;
```

**5) Luminance getters**

```objc
// Get the color luminance as byte or float
UIColor *color = /* Any color */;
CGFloat luminance = color.luminance;
uint8_t  byteLuminance = color.byteLuminance;
```

**6) Utilities**

```objc
// Helper macros to create colors RGBA or ARGB hexadecimal values
uint32_t magentaHex = RGBA_TO_HEX( 255, 0, 255, 255 ); // Will be 0xFF00FFFF
uint32_t magentaHexWithAlphaFirst = ARGB_TO_HEX( 255, 255, 0, 255 ); // Will be 0xFFFF00FF
```

Requirements
------------

iOS 4.3 or higher, ARC only

Installation
------------

**NitroUIColorCategories** is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

```ruby
pod "NitroUIColorCategories"
```

**NitroUIColorCategories** adds the `-ObjC` linker flag to targets using it. Without it, categories code would be stripped out, resulting in linker errors. For more info about categories inside static libraries, see: [Building Objective-C static libraries with categories](https://developer.apple.com/library/mac/qa/qa1490/_index.html)

Author
------

- [Daniel L. Alves](http://github.com/danielalves) ([@alveslopesdan](https://twitter.com/alveslopesdan))

License
-------

**NitroUIColorCategories** is available under the MIT license. See the LICENSE file for more info.
