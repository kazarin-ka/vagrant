# Pack of different vagrant configurations



List: \
```
├── CX11
│   ├── Centos
│   │   └── swe-c7_web_a
│   │       ├── configs
│   │       │   ├── apache.conf
│   │       │   ├── phpMyAdmin.conf
│   │       │   └── README.md
│   │       ├── other
│   │       │   ├── index.html
│   │       │   ├── info.php
│   │       │   └── README.md
│   │       ├── README.md
│   │       ├── scripts
│   │       │   ├── c7_web_a.sh
│   │       │   └── result.sh
│   │       ├── sources
│   │       │   └── README.md
│   │       ├── ssh_keys
│   │       │   └── README.md
│   │       ├── temp
│   │       └── Vagrantfile
│   └── Ubuntu
│       ├── swe-u16_web_a
│       │   ├── configs
│       │   │   ├── apache.conf
│       │   │   └── README.md
│       │   ├── other
│       │   │   ├── info.php
│       │   │   └── README.md
│       │   ├── README.md
│       │   ├── scripts
│       │   │   ├── result.sh
│       │   │   └── u16_web_a.sh
│       │   ├── sources
│       │   │   └── README.md
│       │   ├── ssh_keys
│       │   │   └── README.md
│       │   └── Vagrantfile
│       └── swe-u16_web_n
│           ├── configs
│           │   ├── nginx.conf
│           │   └── README.md
│           ├── other
│           │   ├── info.php
│           │   └── README.md
│           ├── README.md
│           ├── scripts
│           │   ├── result.sh
│           │   └── u16_web_n.sh
│           ├── sources
│           │   └── README.md
│           ├── ssh_keys
│           │   └── README.md
│           └── Vagrantfile
└── README.md
```

CX11 - web servers with apache/nginx + php + mysql

**Naming:**
 - u16 - ubuntu server 16.04
 - c7 - centos 7
 - web_a - apache web server
 - web_n - nginx web server