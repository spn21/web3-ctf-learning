🇮🇳人题？好像只能正常思路解？

setup:
create2 爆破；
stage1: 原理跟Ethernaut CTF的[elevator题](https://www.levi104.com/2023/06/23/04.Ethernaut%20CTF/11.Elevator)原理差不多，需要两次返回的地址不一样，第一次encodePack("1337"),第二次encodePack("13337")
可以用stage3的staticcall进行微操

stage2: 一直消耗gas，让剩余量剩余为7（还是一直爆破？）

stage3: 这里有gas<3_888限制，伪随机数构造

stage4: 找到stats[4][msg.sender]在EVM中的存储位置，用嵌套mapping寻找并设置为true

(写完感慨：有种赤石都感觉bushi)