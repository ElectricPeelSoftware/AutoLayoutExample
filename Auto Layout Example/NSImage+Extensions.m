//
//  NSImage+Extensions.m
//  Hedgehog
//
//  Created by Peter Stuart on 4/15/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import "NSImage+Extensions.h"

@implementation NSImage (Extensions)

- (NSImage *)maskedCircularImageWithDiameter:(CGFloat)diameter {
	NSBitmapImageRep *respresentation = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL pixelsWide:diameter pixelsHigh:diameter bitsPerSample:8 samplesPerPixel:4 hasAlpha:YES isPlanar:NO colorSpaceName:NSDeviceRGBColorSpace bitmapFormat:NSAlphaFirstBitmapFormat bytesPerRow:0 bitsPerPixel:0];
	
	NSGraphicsContext *context = [NSGraphicsContext graphicsContextWithBitmapImageRep:respresentation];

	[NSGraphicsContext saveGraphicsState];
	[NSGraphicsContext setCurrentContext:context];
	
	NSRect sourceRect = NSMakeRect(0, 0, self.size.width, self.size.height);
	NSRect destinationRect = NSMakeRect(0, 0, diameter, diameter);
	
	NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect:destinationRect];
	
	[path addClip];
		
	[self drawInRect:destinationRect fromRect:sourceRect operation:NSCompositeSourceOver fraction:1.0];
	
	[NSGraphicsContext restoreGraphicsState];
	
	NSImage *maskedImage = [[NSImage alloc] initWithSize:NSMakeSize(diameter, diameter)];
	[maskedImage addRepresentation:respresentation];
	
	return maskedImage;
}

@end
