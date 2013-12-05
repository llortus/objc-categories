//
//  NSImage+SimpleRotation.h
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
//  DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface NSImage (SimpleRotation)

// Returns a new NSImage rotated counter-clockwise by the specified degrees, negative numbers
// will cause clockwise rotation. The new image will be resized so that it is large enough to
// contain the original image rectangle after rotation. Areas of the new image which are "empty"
// due to the rotation will be transparent.
- (NSImage*)imageRotatedByDegrees:(CGFloat)degrees;

// Performs the same rotation where positive degrees indicate clockwise rotation and negative
// counter-clockwise.
- (NSImage*)imageRotatedClockwiseByDegrees:(CGFloat)degrees;
@end