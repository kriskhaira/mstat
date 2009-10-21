//
//  MSModemInstance.h
//  mstat
//
//  Created by dirk.eisenberg on 10/21/09.
//  Copyright 2009 private. All rights reserved.
//

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
