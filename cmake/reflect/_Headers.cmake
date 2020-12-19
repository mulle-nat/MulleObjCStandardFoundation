#
# cmake/reflect/_Headers.cmake is generated by `mulle-sde reflect`. Edits will be lost.
#
if( MULLE_TRACE_INCLUDE)
   MESSAGE( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

set( INCLUDE_DIRS
src
src/Archiver
src/Container
src/Container/NSArray
src/Container/NSDictionary
src/Container/NSSet
src/Exception
src/Locale
src/Notification
src/PropertyList
src/PropertyList/Parsing
src/PropertyList/Printing
src/PropertyList/Stream
src/Undo
src/Value
src/reflect
)

set( PRIVATE_GENERATED_HEADERS
src/reflect/_MulleObjCStandardFoundation-import-private.h
src/reflect/_MulleObjCStandardFoundation-include-private.h
)

set( PRIVATE_HEADERS
src/Archiver/MulleObjCArchiver-Private.h
src/Locale/_MulleGMTTimeZone-Private.h
src/import-private.h
src/include-private.h
src/mulle-foundation-startup-private.inc
src/mulle-foundation-universeconfiguration-private.h
)

set( PUBLIC_GENERATED_HEADERS
src/reflect/_MulleObjCStandardFoundation-import.h
src/reflect/_MulleObjCStandardFoundation-include.h
)

set( PUBLIC_HEADERS
src/Archiver/MulleObjCArchiver.h
src/Archiver/MulleObjCStandardArchiverFoundation.h
src/Archiver/MulleObjCUnarchiver.h
src/Archiver/NSArchiver.h
src/Archiver/NSCoder.h
src/Archiver/NSKeyedArchiver.h
src/Archiver/NSKeyedUnarchiver.h
src/Archiver/NSObject+NSCoder.h
src/Archiver/NSUnarchiver.h
src/Archiver/mulle_buffer_archiver.h
src/Container/MulleObjCContainerDescription.h
src/Container/MulleObjCStandardContainerFoundation.h
src/Container/NSArray/NSArray+NSSortDescriptor.h
src/Container/NSArray/NSArray+NSString.h
src/Container/NSDictionary/NSMapTable+NSArray+NSString.h
src/Container/NSSet/NSHashTable+NSArray+NSString.h
src/Container/NSSet/NSSet+NSString.h
src/Container/NSSortDescriptor+NSCoder.h
src/Container/NSSortDescriptor.h
src/Exception/MulleObjCStandardExceptionFoundation.h
src/Exception/NSAssertionHandler.h
src/Exception/NSError.h
src/Exception/NSException.h
src/Locale/MulleObjCStandardLocaleFoundation.h
src/Locale/NSArray+NSLocale.h
src/Locale/NSCalendarDate+NSDateFormatter.h
src/Locale/NSCalendarDate.h
src/Locale/NSDateFormatter.h
src/Locale/NSDate+NSCalendarDate.h
src/Locale/NSDate+NSDateFormatter.h
src/Locale/NSDictionary+NSLocale.h
src/Locale/NSLocale.h
src/Locale/NSLocalizedDateFactory.h
src/Locale/NSNumberFormatter.h
src/Locale/NSNumber+NSLocale.h
src/Locale/NSString+NSLocale.h
src/Locale/NSTimeZone.h
src/MulleObjCFoundationCore.h
src/MulleObjCLoader+MulleObjCStandardFoundation.h
src/MulleObjCStandardFoundation.h
src/Notification/MulleObjCStandardNotificationFoundation.h
src/Notification/NSNotificationCenter.h
src/Notification/NSNotification.h
src/Notification/NSThread+NSNotification.h
src/PropertyList/MulleObjCStandardPropertyListFoundation.h
src/PropertyList/NSDictionary+PropertyList.h
src/PropertyList/NSPropertyListSerialization.h
src/PropertyList/NSString+PropertyList.h
src/PropertyList/Parsing/NSArray+PropertyListParsing.h
src/PropertyList/Parsing/NSData+PropertyListParsing.h
src/PropertyList/Parsing/NSDictionary+PropertyListParsing.h
src/PropertyList/Parsing/NSObject+PropertyListParsing.h
src/PropertyList/Parsing/NSString+PropertyListParsing.h
src/PropertyList/Printing/MulleObjCPropertyListPrinting.h
src/PropertyList/Printing/NSArray+PropertyListPrinting.h
src/PropertyList/Printing/NSData+PropertyListPrinting.h
src/PropertyList/Printing/NSDate+PropertyListPrinting.h
src/PropertyList/Printing/NSDictionary+PropertyListPrinting.h
src/PropertyList/Printing/NSNumber+PropertyListPrinting.h
src/PropertyList/Printing/NSString+PropertyListPrinting.h
src/PropertyList/Stream/MulleObjCBufferedInputStream+InlineAccessors.h
src/PropertyList/Stream/MulleObjCBufferedInputStream.h
src/PropertyList/Stream/MulleObjCBufferedOutputStream+InlineAccessors.h
src/PropertyList/Stream/MulleObjCBufferedOutputStream.h
src/PropertyList/Stream/_MulleObjCPropertyListReader+InlineAccessors.h
src/PropertyList/Stream/_MulleObjCPropertyListReader.h
src/PropertyList/Stream/MulleObjCStream.h
src/PropertyList/Stream/MulleObjCUTF8StreamReader+InlineAccessors.h
src/PropertyList/Stream/MulleObjCUTF8StreamReader.h
src/Undo/MulleObjCStandardUndoFoundation.h
src/Undo/NSUndoManager.h
src/Value/MulleObjCCharacterBitmap.h
src/Value/_MulleObjCConcreteBitmapCharacterSet.h
src/Value/_MulleObjCConcreteCharacterSet.h
src/Value/_MulleObjCConcreteInvertedCharacterSet.h
src/Value/_MulleObjCConcreteRangeCharacterSet.h
src/Value/MulleObjCStandardValueFoundation.h
src/Value/NSArray+StringComponents.h
src/Value/NSCharacterSet.h
src/Value/NSData+Components.h
src/Value/NSFormatter.h
src/Value/NSMutableCharacterSet.h
src/Value/NSMutableString+Search.h
src/Value/NSScanner.h
src/Value/NSString+Components.h
src/Value/NSString+Escaping.h
src/Value/NSString+NSCharacterSet.h
src/Value/NSString+Search.h
src/import.h
src/include.h
)
