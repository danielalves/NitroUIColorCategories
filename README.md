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
red.toRGBAHex // Will be 0xFF0000FF
red.toARGBHex // Will be 0xFFFF0000

// To hexadecimal strings
UIColor *blue = [UIColor blueColor];
blue.toRGBHexString  // Will be @"0x0000FF"
blue.toARGBHexString // Will be @"0xFF0000FF"
blue.toRGBAHexString // Will be @"0x0000FFFF"
    
// To dictionaries
UIColor *transparentWhite = [UIColor colorWithWhite: 1.0f alpha: 0.0f];
transparentWhite.toColorComponentsDictionary // Will be @{ COLOR_DICT_COMPONENT_KEY_RED: @( 1.0f ),
                                             //            COLOR_DICT_COMPONENT_KEY_GREEN: @( 1.0f ),
                                             //            COLOR_DICT_COMPONENT_KEY_BLUE: @( 1.0f ),
                                             //            COLOR_DICT_COMPONENT_KEY_ALPHA: @( 0.0f ) }
    
transparentWhite.toColorByteComponentsDictionary // Will be @{ COLOR_DICT_COMPONENT_KEY_RED: @( 255 ),
                                                 //            COLOR_DICT_COMPONENT_KEY_GREEN: @( 255 ),
                                                 //            COLOR_DICT_COMPONENT_KEY_BLUE: @( 255 ),
                                                 //            COLOR_DICT_COMPONENT_KEY_ALPHA: @( 0 ) }
```

**3) Comparison**

**4) RGBA components getters**

**5) Luminance getters**

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

**Don't forget to add the** `-ObjC` **linker flag to targets using NitroUIColorCategories.** If you don't do so, there'll probably be linker errors. For more info about categories inside static libraries, see: [Building Objective-C static libraries with categories](https://developer.apple.com/library/mac/qa/qa1490/_index.html)

Author
------

- [Daniel L. Alves](http://github.com/danielalves) ([@alveslopesdan](https://twitter.com/alveslopesdan))

License
-------

**NitroUIColorCategories** is available under the MIT license. See the LICENSE file for more info.
