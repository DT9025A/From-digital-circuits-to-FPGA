# From-digital-circuits-to-FPGA

## 前言

小白想要入门FPGA，想到学习数电的教材上便有FPGA相关的知识，便跟着数字电路的学习过程来入门了


## 仓库简介

一些数字电路的FPGA实现，基于正点原子新起点FPGA开发板

FPGA芯片为Altera Cyclone IV **EP4CE10F17C8N**

EP4C：Cyclone IV

E(GX)：普通逻辑资源丰富（高速串行收发器）

10：LE逻辑单元约有10K

[C：高速串行收发器数量，没有所以不写]

F(E,Q,U,M)：FBGA（EQFP, PQFP, UBGA, MBGA）

17：引脚数量为256

C(I,A)：民用级0-85℃（工业级-40-100℃，军用级-40-125℃）

8：速度等级，最大工作频率约为400MHz

N(ES)：无铅（工程样片）


## 仓库内容

1. 基本逻辑门

2. 2-4译码器

    2.1. 3-8译码器

3. 8-1数据选择器

4. 一位全加器

5. 1-4数据分配器

## 目录结构

|文件夹|说明|
|-|-|
|doc|说明文档|
|par|Quartus工程文件|
|rtl|Verilog代码|
|sim|仿真文件|

## HDLBits的练习代码
[HDLBits](https://hdlbits.01xz.net/wiki/Main_Page)

代码位于HDLBits目录下，按照章节目录分开

## 参考书目

* 《数字电路与逻辑设计》，范文兵、李浩亮、李敏编著
* 《新起点FPGA开发指南_V1.3》，正点原子
