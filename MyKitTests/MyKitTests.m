// MyKitTests MyKitTests.m
//
// Copyright © 2011, Roy Ratcliffe, Pioneering Software, United Kingdom
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the “Software”), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS,” WITHOUT WARRANTY OF ANY KIND, EITHER
// EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
// OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//
//------------------------------------------------------------------------------

#import "MyKitTests.h"
#import "NSObject+MyKit.h"

@implementation MyKitTests

- (void)testStringFromClass
{
	STAssertEqualObjects([[[NSObject alloc] init] stringFromClass], @"NSObject", nil);
	
	// NSString deploys a class clustering architecture. The actual class is an
	// implementation-specific sub-class or compatible class, depending on what
	// kind of string, and presumably what version of Cocoa and on what platform
	// since the exact underlying class might change. Be prepared for test
	// breakage.
	STAssertEqualObjects([@"" stringFromClass], @"__NSCFConstantString", nil);
	
	// This is freaky. You would not expect this to work. But it does; classes
	// are also objects. Invoking an instance method on a class: it compiles and
	// runs! You would expect the compiler to baulk, but no.
	STAssertEqualObjects([NSObject stringFromClass], @"NSObject", nil);
}

@end
