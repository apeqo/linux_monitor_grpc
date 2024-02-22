#pragma once

#include <string>
#include "monitor_inter.h"
#include "monitor_info.grpc.pb.h"
#include "monitor_info.pb.h"

namespace monitor {
class CpuLoadMonitor : public monitorInter {
    public:
        CpuLoadMonitor(){}
        void UpdateOnce(monitor::proto::MonitorInfo* monitor_info) override {}
        void Stop() override {}

    private:
        float load_avg_1_;
        float load_avg_3_;
        float load_avg_15_;
};
}