//___FILEHEADER___

#include <os/log.h>

#include <DriverKit/IOUserServer.h>
#include <DriverKit/IOLib.h>

#include "___PACKAGENAMEASIDENTIFIER___.h"

kern_return_t
IMPL(___PACKAGENAMEASIDENTIFIER___, Start)
{
    kern_return_t ret;
    ret = Start(provider, SUPERDISPATCH);
    os_log(OS_LOG_DEFAULT, "Hello World");
    return ret;
}
