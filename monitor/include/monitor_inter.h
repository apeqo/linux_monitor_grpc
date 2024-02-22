#pragma once

#include <string>
#include "monitor_inter.h"
#include "monitor_info.grpc.pb.h"

namespace monitor {
class MonitorInter {
    public:
        MonitorInter() {}
        virtual ~MonitorInter() {}
        virtual void UpdateOnce(monitor::proto::MonitorInfo* monitor_info) = 0;
        virtual void Stop() = 0;
};
}