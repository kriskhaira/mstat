//
//  SerialPortCommunication.h
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

int OpenSerialPort(const char *bsdPath);

void CloseSerialPort(int fileDescriptor);