<!--
 * @Author: loyunemo
 * @Date: 2023-10-23 23:08:51
 * @LastEditors: loyunemo
 * @LastEditTime: 2023-10-26 09:07:46
 * @FilePath: \Repo_Computer_Simulation\Hw4\描述Hw4.md
-->
课本𝑃107−108:   1、3、5、7；
➢上机练习（将所作练习的概要写到作业本上）：1.请换用Gibbs采样方法，重做圆周率的随机投点模拟（二维）2.从下列抽样算法中自选一类，并查阅相关文献，解释所选算法并实现该算法（给出抽样的统计结果）：1.Fisher-Yates shuffle(洗牌)算法2.Knuth-DurstenfeldShuffle(洗牌)算法3.蓄水池(Reservoir)抽样算法

给定一个数据流，数据流长度N很大，且N直到处理完所有数据之前都不可知，请问如何在只遍历一遍数据（O(N)）的情况下，能够随机选取出m个不重复的数据。

这个场景强调了3件事：

数据流长度N很大且不可知，所以不能一次性存入内存。
时间复杂度为O(N)。
随机选取m个数，每个数被选中的概率为m/N。
第1点限制了不能直接取N内的m个随机数，然后按索引取出数据。第2点限制了不能先遍历一遍，然后分块存储数据，再随机选取。第3点是数据选取绝对随机的保证。讲真，在不知道蓄水池算法前，我想破脑袋也不知道该题做何解。
```c
int[] reservoir = new int[m];

// init
for (int i = 0; i < reservoir.length; i++)
{
    reservoir[i] = dataStream[i];
}

for (int i = m; i < dataStream.length; i++)
{
    // 随机获得一个[0, i]内的随机整数
    int d = rand.nextInt(i + 1);
    // 如果随机整数落在[0, m-1]范围内，则替换蓄水池中的元素
    if (d < m)
    {
        reservoir[d] = dataStream[i];
    }
}
```