# Beginning ARM64 Assembly Programming

## 1. 快速开始

### 1.1. 容器化运行环境

```bash
cd docker
bash dockerize.sh
cd -
```

### 1.2. 启动容器

```bash
bash play.sh
```

> 后续步骤在容器内执行。

### 1.3. 运行示例程序

```bash
cd /workspace/chapter01
make
```

样例输出如下

```bash
root@cf9d0cd4ead9:/workspace/chapter01# make
aarch64-none-linux-gnu-as -a=hello.lst -g --gdwarf-2 -o hello.o hello.s
aarch64-none-linux-gnu-gcc -gdwarf -o hello.out -no-pie hello.o --static
qemu-aarch64 ./hello.out
hello, worldroot@cf9d0cd4ead9:/workspace/chapter01#
```

## 2. 参考文献
- [multiarch/qemu-user-static](https://github.com/multiarch/qemu-user-static)
