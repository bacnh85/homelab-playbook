# Introduction

Purpose to deploy self-host via podman

## Listed services


## Add GPU support to LXC (Proxmox)

Install NVIDIA driver:
```bash
wget http://international.download.nvidia.com/XFree86/Linux-x86_64/565.57.01/NVIDIA-Linux-x86_64-565.57.01.run
chmod a+x NVIDIA-Linux-x86_64-565.57.01.run
./NVIDIA-Linux-x86_64-565.57.01.run --dkms
```

Confirm NVIDIA driver works well:
```bash
nvidia-smi
Tue Jan 14 10:51:55 2025
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 565.57.01              Driver Version: 565.57.01      CUDA Version: 12.7     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  Quadro P620                    On  |   00000000:42:00.0 Off |                  N/A |
| 34%   39C    P8             N/A /  N/A  |     473MiB /   2048MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
                                                                                         
+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI        PID   Type   Process name                              GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|    0   N/A  N/A   2412083      C   /opt/venv/bin/python                          468MiB |
+-----------------------------------------------------------------------------------------+
```

```bash
lxc.cgroup2.devices.allow: c 195:* rwm
lxc.cgroup2.devices.allow: c 235:* rwm
lxc.cgroup2.devices.allow: c 2398:* rwm
lxc.cgroup2.devices.allow: c 226:* rwm
lxc.mount.entry: /dev/nvidia0 dev/nvidia0 none bind,optional,create=file
lxc.mount.entry: /dev/nvidiactl dev/nvidiactl none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-modeset dev/nvidia-modeset none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-uvm dev/nvidia-uvm none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-uvm-tools dev/nvidia-uvm-tools none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-caps/nvidia-cap1 dev/nvidia-caps/nvidia-cap1 none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-caps/nvidia-cap2 dev/nvidia-caps/nvidia-cap2 none bind,optional,create=file
```

Push driver to LXC:
```bash
pct push 106 NVIDIA-Linux-x86_64-565.57.01.run /root/NVIDIA-Linux-x86_64-565.57.01.run
```

In LXC, install NVIDIA driver:
```bash
chmod a+x NVIDIA-Linux-x86_64-565.57.01.run
./NVIDIA-Linux-x86_64-565.57.01.run --no-kernel-module
```
