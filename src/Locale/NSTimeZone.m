//
//  NSTimeZone.m
//  MulleObjCStandardFoundation
//
//  Copyright (c) 2011 Nat! - Mulle kybernetiK.
//  Copyright (c) 2011 Codeon GmbH.
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
#import "NSTimeZone.h"

// other files in this library
#import "_NSGMTTimeZone-Private.h"

// other libraries of MulleObjCStandardFoundation
#import "MulleObjCFoundationContainer.h"
#import "MulleObjCFoundationData.h"
#import "MulleObjCFoundationString.h"
#import "MulleObjCFoundationValue.h"

// std-c and dependencies


@interface _MulleObjCLocalTimeZone : NSTimeZone
@end


@implementation _MulleObjCLocalTimeZone

- (NSMethodSignature *) methodSignatureForSelector:(SEL) aSelector
{
   return( [super methodSignatureForSelector:@selector( self)]);
}


- (void) forwardInvocation:(NSInvocation *) anInvocation
{
   [anInvocation setTarget:[NSTimeZone defaultTimeZone]];
   [anInvocation invoke];
}


@end


@implementation NSObject( _NSTimeZone)

- (BOOL) __isNSTimeZone
{
   return( NO);
}

@end


@implementation NSTimeZone

- (BOOL) __isNSTimeZone
{
   return( YES);
}


static NSString   *NSSystemTimeZoneKey  = @"System";
static NSString   *NSDefaultTimeZoneKey = @"Default";
static NSString   *NSGMTTimeZoneKey     = @"GMT";


static struct
{
   mulle_thread_mutex_t   _lock;
   NSMapTable             *_table;
} Self;


static inline void   SelfLock( void)
{
   mulle_thread_mutex_lock( &Self._lock);
}


static inline void   SelfUnlock( void)
{
   mulle_thread_mutex_unlock( &Self._lock);
}


+ (void) initialize
{
   if( ! Self._table)
   {
      Self._table = NSCreateMapTable( NSObjectMapKeyCallBacks,
                                      NSObjectMapValueCallBacks,
                                      4);
      mulle_thread_mutex_init( &Self._lock);
   }

}

+ (void) deinitialize
{
   @autoreleasepool
   {
      // table will release values, reap them ASAP
      NSFreeMapTable( Self._table);
   }
   Self._table = NULL;
   mulle_thread_mutex_done( &Self._lock);
#ifdef DEBUG
   memset( &Self, 0xEE, sizeof( Self));
#endif
}



+ (instancetype) timeZoneWithName:(NSString *) name
{
   return( [[[self alloc] initWithName:name] autorelease]);
}


+ (instancetype) timeZoneWithName:(NSString *) name
                             data:(NSData *) data
{
   return( [[[self alloc] initWithName:name
                                  data:data] autorelease]);
}


- (instancetype) initWithName:(NSString *) name
                         data:(NSData *) data;
{
   [self init];

   _name = [name copy];
   _data = [_data copy];

   return( self);
}


- (void) dealloc
{
   [_data release];
   [_name release];

   [super dealloc];
}


- (id) copy
{
   return( [self retain]);
}


#pragma mark - convenience constructors


+ (instancetype) timeZoneWithAbbreviation:(NSString *) key
{
   NSString  *name;

   name = [[self abbreviationDictionary] objectForKey:key];
   if( ! name)
      return( nil);

   return( [self timeZoneWithName:name]);
}


- (NSString *) name
{
   return( _name);
}


- (NSData *) data
{
   return( _data);
}


+ (NSTimeZone *) systemTimeZone
{
   NSTimeZone   *timeZone;

   SelfLock();
   {
      timeZone = NSMapGet( Self._table,NSSystemTimeZoneKey);
      if( ! timeZone)
      {
         timeZone = [self _uncachedSystemTimeZone];
         NSMapInsert( Self._table, NSSystemTimeZoneKey, timeZone);
      }
   }
   SelfUnlock();
   return( timeZone);
}


+ (void) resetSystemTimeZone
{
   NSTimeZone   *timeZone;

   timeZone = [self _uncachedSystemTimeZone];
   SelfLock();
   {
      NSMapInsert( Self._table, NSSystemTimeZoneKey, timeZone);
   }
   SelfUnlock();
}


+ (NSTimeZone *) defaultTimeZone
{
   NSTimeZone   *timeZone;

   SelfLock();
   {
      timeZone = NSMapGet( Self._table, NSDefaultTimeZoneKey);
   }
   SelfUnlock();

   if( ! timeZone)
      timeZone = [self systemTimeZone];

   return( timeZone);
}


+ (NSTimeZone *) _GMTTimeZone
{
   return( [_NSGMTTimeZone sharedInstance]);
}


+ (void) setDefaultTimeZone:(NSTimeZone *) tz
{
   tz = [[tz copy] autorelease];
   SelfLock();
   {
      NSMapInsert( Self._table, NSDefaultTimeZoneKey, tz);
   }
   SelfUnlock();
}


+ (NSTimeZone *) localTimeZone
{
   // return a proxy
   return( [[_MulleObjCLocalTimeZone new] autorelease]);
}


- (NSInteger) secondsFromGMT
{
   return( [self secondsFromGMTForDate:[NSDate date]]);
}


- (NSString *) abbreviation
{
   return( [self abbreviationForDate:[NSDate date]]);
}


- (BOOL) isDaylightSavingTime
{
   return( [self isDaylightSavingTimeForDate:[NSDate date]]);
}


- (NSString *) description
{
   return( [NSString stringWithFormat:@"%@ (%@) offset %ld%s",
                                 _name,
                                 [self abbreviation],
                                 [self secondsFromGMT],
                                 [self isDaylightSavingTime] ? " (Daylight)" : ""]);
}


#pragma mark - hash and equality

- (NSUInteger) hash
{
   return( [self->_name hash]);
}


- (BOOL) isEqual:(id) other
{
   if( ! [other __isNSTimeZone])
      return( NO);
   return( [self isEqualToTimeZone:other]);
}


- (BOOL) isEqualToTimeZone:(NSTimeZone *) other
{
   return( [self->_name isEqualToString:[other name]]);
}

@end
