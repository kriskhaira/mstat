//
//  MSModemInstance.m
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
