//
//  MSMainWindowController.m
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

#import "MSMainWindowController.h"

@implementation MSMainWindowController

- (void)awakeFromNib
{
	// create our modem 
	modem = [ModemE220 instance:self];
	
	// start the stat thread
	[modem startStatisticInterface];
}

- (void) setSignalStrength:(int)strength
{
	int level = 0;
	int p;
	
	if ( strength == 0 || strength == 99)
	{
		level = 0;
		p = 0;
	}
	else
	{
		level = strength / 5;
		p = (100 * strength) / 25;
	}
	
	NSColor* activeColor = [NSColor greenColor];
	NSColor* inactiveColor = [NSColor lightGrayColor];
	
	// 0 - 1  --> red 
	if ( level == 0 || level == 1 )
		activeColor = [NSColor redColor];
	
	// 2 --> yellow
	if ( level == 2 )
		activeColor = [NSColor yellowColor];
		
	if ( level >= 0 && strength > 0 )
		[_level0 setColor:activeColor];
	else
		[_level0 setColor:inactiveColor];
	
	if ( level >= 1 )
		[_level1 setColor:activeColor];
	else
		[_level1 setColor:inactiveColor];

	if ( level >= 2 )
		[_level2 setColor:activeColor];
	else
		[_level2 setColor:inactiveColor];

	if ( level >= 3 )
		[_level3 setColor:activeColor];
	else
		[_level3 setColor:inactiveColor];

	if ( level >= 4 )
		[_level4 setColor:activeColor];
	else
		[_level4 setColor:inactiveColor];

	if ( level >= 5 )
		[_level5 setColor:activeColor];
	else
		[_level5 setColor:inactiveColor];
	
	NSString* sv = [NSString stringWithFormat:@"%d (%d %%)", strength, p];
	
	[_levelText setStringValue:sv];
	
}


- (void) updateModemData:(MSModemInstance*)modemData
{
	[self setSignalStrength:modemData->_SignalStrength];
}

@end
