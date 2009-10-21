//
//  ModemE220.m
//  mstat
//
//  Created by dirk.eisenberg on 10/21/09.
//  Copyright 2009 private. All rights reserved.
//

#import "IModemDriver.h"
#import "ModemE220.h"

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <curses.h>

@implementation ModemE220

+ (ModemE220*) instance:(NSObject*)displayController
{
	ModemE220* modem = [[ModemE220 alloc] init];
	[modem initInstance:"/dev/tty.HUAWEIMobile-Pcui" :displayController];
	return modem;
}

- (void)startStatisticInterface
{
	[NSThread detachNewThreadSelector:@selector(threadStatisticReader:) toTarget:self withObject:self];	
}

- (void)threadStatisticReader:(id)sender
{		
    int fd, bytes;
	char *buf, *buf2;
	char c;
	int signal;
	
	buf=(char *)malloc(256*sizeof(char));
	
	fd = open(self->_bsdDevicePath, O_RDONLY | O_NOCTTY | O_NONBLOCK );
	if (fd < 0) 
	{
		exit(1);
	}
	
	while (c!='q'&&c!='Q')
	{
        while ((c=getch())==ERR)
		{
			bytes = read(fd,buf,255);
			buf2=strchr(buf,'^');
			buf[bytes]=0x00;
			
			if (buf2) {
				strcpy(buf, buf2);
				if (buf[0]=='^')
				{
					if ( buf[1] == 'R' )
					{
						// convert the signal strength
						signal=atoi(buf+6);			
						
						// set the value
						[sender setSignalStrength:signal];
						
						// update all observer
						[sender signalDataUpdated];
					}
				}
			}
        }
	}
}


@end
