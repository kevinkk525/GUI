About
======

This is library for color manipulations. It allows you to extrude and pack color channels, convert the RGB color model to HSB and vice versa, perform alpha blending, generate color transitions and convert the color to 8-bit format for the OpenComputers palette.

Installation
======

Source code is available [here](https://github.com/IgorTimofeev/Color/blob/master/lib/Color.lua): You can download library to computer via single command:

    wget https://github.com/IgorTimofeev/Color/blob/master/lib/Color.lua /lib/color.lua -f

Working with color channels
======

color.**RGBToInteger**( red, green, blue ): *int* integerColor
-----------------------------------------------------------
| Type | Parameter | Description |
| ------ | ------ | ------ |
| *byte* **[0; 255]** | red | Red color channel |
| *byte* **[0; 255]** | green | Green color channel |
| *byte* **[0; 255]** | blue | Blue color channel |

The method packages three color channels and returns a 24-bit integer variable

color.**integerToRGB**( integerColor ): *byte* red, *byte* green, *byte* blue
-----------------------------------------------------------
| Type | Parameter | Description |
| ------ | ------ | ------ |
| *int*  | integerColor | Color in 0xRRGGBB format |

The method extrudes three color channels from a 24-bit integer variable. The values of the returned data are in the range **[0; 255]**

Color processing
======

color.**blend**( firstColor, secondColor, secondColorTransparency ): *int* blendedColor
-----------------------------------------------------------
| Type | Parameter | Description |
| ------ | ------ | ------ |
| *int* | firstColor | First color |
| *int* | secondColor | Second color |
| *float* **[0.0; 1.0]** | secondColorTransparency | Second color transparency |

Mix two colors considering the transparency of the second color. For example, if you perform this operation on 0xFF0000 and 0x000000 colors with a **0.5** transparency of second one, the result will be 0x7F0000 (dark red)

color.**transition**( firstColor, secondColor, position ): *int* transitionColor
-----------------------------------------------------------
| Type | Parameter | Description |
| ------ | ------ | ------ |
| *int* | firstColor | First color |
| *int* | secondColor | Second color |
| *float* **[0.0; 1.0]** | position | Position of transition point from first color to second |

The method generates a transitive color between first and second ones, based on the transition argument, where the value 0.0 is equivalent to the first color, and 1.0 is the second color. For example, if you perform this operation on 0x000000 and 0xFFFFFF colors with transition position equals 0.5, then the result will be 0x7F7F7F (gray)

Conversion of color models
======

color.**RGBToHSB**( red, green, blue ): *int* hue, *float* saturation, *float* brightness
-----------------------------------------------------------
| Type | Parameter | Description |
| ------ | ------ | ------ |
| *byte* **[0; 255]** | red | Red color channel |
| *byte* **[0; 255]** | green | Green color channel |
| *byte* **[0; 255]** | blue | Blue color channel |

The method converts three color channels of the RGB color model to the HSB (HSV) color model and returns the corresponding result. The returned *hue* value is in the range **[0; 360]**, and *saturation* and *brightness* - in the range **[0.0; 1.0]**.

For convenience, there is also a method color.**integerToHSB**(*int* integerColor): *int* hue, *float* saturation, *float* brightness

color.**HSBToRGB**( hue, saturation, brightness ): *byte* red, *byte* green, *byte* blue
-----------------------------------------------------------
| Type | Parameter | Description |
| ------ | ------ | ------ |
| *int* **[0; 360]** | hue | Hue |
| *float* **[0.0; 1.0]** | saturation | Saturation |
| *float* **[0.0; 1.0]** | brightness | Brightness |

The method converts the parameters of the HSB color model (HSV) into three color channels of the RGB model and returns the corresponding result.
For convenience, there is also a method color.**HSBToInteger**(*int* hue, *float* saturation, *float* brightness): *int* integerColor

Color compression
======

color.**to8Bit**( 24BitColor ): *byte* 8BitColor
-----------------------------------------------------------
| Type | Parameter | Description |
| ------ | ------ | ------ |
| *int* | 24BitColor | Color in 0xRRGGBB format |

This method refers to 256-color OpenComputers palette and returns the color index that best matches the passed value using the same search method as in gpu.**setBackground**(color) do. As a result, a variable is returned in the range [0; 255], which can be used to write to a binary file, allowing you to save extra memory. I draw your attention that the method is quite **slow**, and is not suitable for drawing graphics on the screen in realtime.

color.**to24Bit**( 8BitColor ): *int* 24BitColor
-----------------------------------------------------------
| Type | Parameter | Description |
| ------ | ------ | ------ |
| *int* | 8BitColor | Index of OpenComputers palette |

The method allows you to convert the 8-bit index created by the color.**to8Bit** method to 24 bit integer color value