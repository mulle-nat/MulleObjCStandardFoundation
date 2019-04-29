//
//  NSObject+NSString.m
//  MulleObjCStandardFoundation
//
//  Copyright (c) 2016 Nat! - Mulle kybernetiK.
//  Copyright (c) 2016 Codeon GmbH.
//  All rights reserved.
//
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer.
//
//  Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
//  Neither the name of Mulle kybernetiK nor the names of its contributors
//  may be used to endorse or promote products derived from this software
//  without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//
#import "MulleObjCFoundationBase.h"

// other files in this library
#import "NSString.h"
#import "NSString+Sprintf.h"
#import "NSString+Search.h"
#import "NSStringObjCFunctions.h"

// other libraries of MulleObjCStandardFoundation
#import "MulleObjCFoundationBase.h"

// std-c and dependencies
#include <ctype.h>


@implementation NSObject (NSString)

- (NSString *) description
{
   return( NSStringFromClass( [self class]));
}


- (NSString *) testDescription
{
   return( [self description]);
}


- (NSString *) mulleDebugContentsDescription
{
   return( nil);
}


- (NSString *) debugDescription
{
   NSString     *contents;
   NSUInteger   length;

   contents = [self mulleDebugContentsDescription];
   length   = [contents length];
   if( ! length)
      return( [NSString stringWithFormat:@"<%@ %p>", [self class], self]);

   if( length >= 8192)
      return( [NSString stringWithFormat:@"<%@ %p \"%.8192@...>", [self class], self, contents]);

   return( [NSString stringWithFormat:@"<%@ %p \"%@\">", [self class], self, contents]);
}


- (char *) cStringDescription
{
   return( [[self description] cStringDescription]);
}


- (NSComparisonResult) mulleCompareDescription:(id) other;
{
   return( [[self description] compare:[other description]]);
}


// this is unqoted for NSData, NSDictionary etc.
- (NSString *) mulleQuotedDescriptionIfNeeded
{
   return( [self description]);
}

@end
