//
//  MulleObjCConcreteSet.h
//  MulleObjCFoundation
//
//  Created by Nat! on 15.03.16.
//  Copyright © 2016 Mulle kybernetiK. All rights reserved.
//

#import "NSSet.h"

#include <mulle_container/mulle_container.h>


@interface _MulleObjCConcreteSet : NSSet
{
   struct mulle_set   _set;
}

- (instancetype) initWithObjects:(id *) objects
                           count:(NSUInteger) count
                       copyItems:(BOOL) copyItems;

@end
