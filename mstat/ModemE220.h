//
//  ModemE220.h
//  mstat
//
//  Created by dirk.eisenberg on 10/21/09.
//  Copyright 2009 private. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IModemDriver.h"

@interface ModemE220 : MSModemInstance {

}

+ (ModemE220*) instance:(NSObject*)displayController;

- (void)startStatisticInterface;

@end
