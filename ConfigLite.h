#import <Foundation/Foundation.h>
//#pragma GCC visibility push(hidden)
#import <TargetConditionals.h>
#import <mach/mach_traps.h>
#import <mach-o/dyld.h>
#import <mach/mach.h>
#import <substrate.h>
#import <dlfcn.h>
#include <iostream>
#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#import <sys/types.h>
#include <unistd.h>
#import <mach-o/swap.h>
#import <libkern/OSCacheControl.h>


using namespace std;

struct ProgramVars {
	struct mach_header*      mh;
	int*		      NXArgcPtr;
	const char***	 NXArgvPtr;
	const char***	 environPtr;
	const char**	      __prognamePtr;
};

const char *title, *theMsg;

#define hidme __attribute__((visibility("hidden"))) __attribute__((section("__TEXT,inject")))

/*
 Functions to show an UIAlertView at load time
 */


#define MANY_MACROS
#define MANY_INLINES

 inline void setAlertInfo(const char *alertTitle, const char *alertMessage) __attribute__((always_inline));

 inline void didFinishLaunching(CFNotificationCenterRef center,void *observer,CFStringRef name, const void *object, CFDictionaryRef info)  __attribute__((always_inline));

 /*
 CNDeclare declares variables used for writing
 Usage: CNDeclare(name, offset);
 */
 
#define CNDeclare(name,offset) __attribute__((visibility("hidden"))) uint64_t name = offset

/*
 CNConstructor is a constructor
 */

#define CNConstructor(name) __attribute__((constructor)) hidme void name(struct ProgramVars *pinfo)
