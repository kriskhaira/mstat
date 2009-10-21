//
//  MSMainWindowController.h
//  mstat
//
//  Created by dirk.eisenberg on 10/20/09.
//  Copyright 2009 private. All rights reserved.
//

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
