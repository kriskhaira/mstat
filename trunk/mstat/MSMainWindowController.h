//
//  MSMainWindowController.h
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
#import "ModemE220.h"

@interface MSMainWindowController : NSWindowController {

	IBOutlet NSColorWell*		_level0;
	IBOutlet NSColorWell*		_level1;
	IBOutlet NSColorWell*		_level2;
	IBOutlet NSColorWell*		_level3;
	IBOutlet NSColorWell*		_level4;
	IBOutlet NSColorWell*		_level5;
	IBOutlet NSTextField*		_levelText;
	
@private
	ModemE220* modem;
}

- (void) setSignalStrength:(int)strength;

- (void) updateModemData:(MSModemInstance*)modemData;

@end
