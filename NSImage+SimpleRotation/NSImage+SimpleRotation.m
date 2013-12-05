//
//  NSImage+SimpleRotation.m
//  NSImage category for performing adhoc image rotation
//  Created by Jesse Sipprell on 11/29/13.
//  Copyright (c) 2013 Jesse Sipprell.
//  All rights reserved.
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//      * Redistributions of source code must retain the above copyright
//        notice, this list of conditions and the following disclaimer.
//      * Redistributions in binary form must reproduce the above copyright
//        notice, this list of conditions and the following disclaimer in the
//        documentation and/or other materials provided with the distribution.
//      * Neither the name of Jesse Sipprell or the names of any contributors
//        may be used to endorse or promote products derived from this software
//        without specific prior written permission.
//  
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL Jesse Sipprell BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "NSImage+SimpleRotation.h"

static NSImage *NSSR_performRotation(NSImage *image, CGFloat degrees)
{
  NSRect bounds = { NSZeroPoint, [image size] };
  NSBezierPath *boundsPath = [NSBezierPath bezierPathWithRect:bounds];
  NSAffineTransform *transform = [NSAffineTransform transform];


  [transform rotateByDegrees:degrees];
  [boundsPath transformUsingAffineTransform:transform];
  NSRect rotatedBounds = { NSZeroPoint, [boundsPath bounds].size };
  NSImage *rotatedImage = [[NSImage alloc] initWithSize:rotatedBounds.size];
  bounds.origin.x = NSMidX(rotatedBounds) - ((NSWidth(bounds) / 2));
  bounds.origin.y = NSMidY(rotatedBounds) - ((NSHeight(bounds) / 2));
  transform = [NSAffineTransform transform];
  [transform translateXBy:(NSWidth(rotatedBounds) / 2)
                      yBy:(NSHeight(rotatedBounds) / 2)];
  [transform rotateByDegrees:degrees];
  [transform translateXBy:-(NSWidth(rotatedBounds) / 2)
                      yBy:-(NSHeight(rotatedBounds)/ 2 )];
  [rotatedImage lockFocus];
  [transform concat];
  [image drawInRect:bounds fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0];
  [rotatedImage unlockFocus];
  return rotatedImage;
}

@implementation NSImage (SimpleRotation)
- (NSImage*)imageRotatedByDegrees:(CGFloat)degrees
{
  if(![self isValid])
    return [self copy];

  return NSSR_performRotation(self,degrees);
}

- (NSImage*)imageRotatedClockwiseByDegrees:(CGFloat)degrees
{
  if(![self isValid])
    return [self copy];

  return NSSR_performRotation(self,-degrees);
}
@end