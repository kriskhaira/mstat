//
//  MSModemInstance.h
//
// This file is part of the mstat project and can be redistributed
// and modified with the terms of the General Public Licence V2 (GPL/V2).
// 
// This file is provided "AS IS" with NO WARRANTY OF ANY KIND,
// INCLUDING THE WARRANTIES OF DESIGN, MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE. Dirk Eisenberg reserves all rights not expressly
// granted herein.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#import <Cocoa/Cocoa.h>


@interface MSModemInstance : NSObject {

@public
	// some information
	const char* _bsdDevicePath;
	NSObject* _displayController;
	
	// statistic data
	int _SignalStrength;
}

+ (MSModemInstance*) instanceByDevice:(const char*)bsdDevicePath:(NSObject*) displayController;

- (void) initInstance:(const char*)bsdDevicePath:(NSObject*) displayController;

- (void) setSignalStrength:(int)ss;

- (void) signalDataUpdated;

@end
