//
//  MSModemInstance.m
//  mstat
//
//  Created by dirk.eisenberg on 10/21/09.
//  Copyright 2009 private. All rights reserved.
//

#import "MSModemInstance.h"


@implementation MSModemInstance

+ (MSModemInstance*) instanceByDevice:(const char*)bsdDevicePath:(NSObject*) displayController;
{
	MSModemInstance* instance = [[MSModemInstance alloc] init];
	[instance initInstance:bsdDevicePath:displayController];
	
	return instance;
}

- (void) initInstance:(const char*)bsdDevicePath:(NSObject*) displayController
{
	self->_bsdDevicePath		= bsdDevicePath;
	self->_displayController	= displayController;
}

- (void) setSignalStrength:(int)ss
{
	self->_SignalStrength = ss;
}

- (void) signalDataUpdated
{
	[_displayController updateModemData:self];
}

@end
