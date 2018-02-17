# 报告

报告功能位于[高级工具包](https://www.espocrm.com/extensions/advanced-pack/)。

报告有两种：“列表”型和“表格”型。

## 列表型报告

列表型报告所生成的记录列表可以符合特定的标准。

新建列表型报告的操作步骤：点选“报告”选项卡，然后点击“创建报告”按钮。选择“实体类型”，然后点击在“列表型报告”中的“创建”按钮。

在 _列_ 字段，选出要显示的字段。你可以在下面指定每列的显示参数（如宽度、对齐等）。

在 _列表排序_ 字段中选择排序方式。

在 _筛选器_ 部分，你可以指定一些标准，这决定了哪些记录会在报告中列出。在这里可以使用逻辑运算符“或”和“与”。

在生成报告前，你可以使用 _运行时筛选器_ 来指定不同的筛选器。

你可以将列表型报告 __输出__ 为Excel格式和CSV格式。

## 表格型报告

表格型报告生成按指定字段归组的汇总值。这种报告可以以图表的方式来显示。

![表格型报告](https://github.com/espocrm/documentation/blob/master/_static/images/user-guide/reports/grid.png)

新建表格型报告的操作步骤：点选“报告”选项卡，然后点击“创建报告”按钮。选择所需的“实体类型”，然后在“表格型报告”中点击“创建”按钮。

根据你的报告数据，在 _分组方式_ 字段中挑选一两种数据分组方式。日期字段的分组方式可以是按年、按月、按日。如果按两个字段来分组，报告就是三维的。

在 _列_ 字段，选择一个或多个汇总函数，如COUNT（计数）、SUM（总和）、MIN（最小值）、MAX（最大值）、AVG（平均值）。

_排序方式_ 字段定义了报告数据的排序方式。

你可以在 _筛选器_ 中指定标准，决定哪些记录会在报告中呈现。在这里可以使用逻辑运算符“或”和“与”。

在生成报告前，你可以使用 _运行时筛选器_ 来指定不同的筛选器。

表格型报告可以用图表来呈现数据的结果。_图表类型_ 有以下几种：柱状图（水平）、柱状图（垂直）、饼图、折线图。

可以将表格型报告 __输出__ 为Excel格式和CSV格式。

## 筛选器

### 字段筛选器

这种筛选器易于使用。你可以挑选目标实体字段，也可以挑选相关实体的字段。

![字段筛选器](https://github.com/espocrm/documentation/blob/master/_static/images/user-guide/reports/filter-field.png)

### “或”组

“或”表示此组中的条件至少要满足其中的一项。

![“或”组](https://github.com/espocrm/documentation/blob/master/_static/images/user-guide/reports/filter-or.png)

### “与”组

“与”表示此组中的全部条件都要满足。

### “非”组

它可以排除掉那些不符合指定标准的记录。例如，列出那些没有任何机会达到“谈成结束”（Closed Won）状态或“未成结束”（Closed Lost）状态的账户。

![“非”组](https://github.com/espocrm/documentation/blob/master/_static/images/user-guide/reports/filter-not.png)

### 复杂表达式

这部分适用于高级用户。可以在某些数据库列中使用函数，以及把它与 [公式](https://github.com/espocrm/documentation/blob/master/i18n/zh_CN/administration/formula.md) 表达式的结果进行比较。

注：如果只是与简单的字符串值进行比较，它应放到英文单引号包围的`'一些字符串'`中。

注：在这里，因为公式不适用于指定的记录，所以与实体记录交互的函数无效。

![复杂表达式筛选器](https://github.com/espocrm/documentation/blob/master/_static/images/user-guide/reports/filter-complex.png)

### 具有分组

“具有分组”可以使用汇总函数COUNT（计数）、SUM（总和）、MAX（最大值）、MIN（最小值）、AVG（平均值）。

以下是一些使用样例：

* 列出有一个以上机会点的账户：`COUNT / opportunities.id / Greater Than / 1`。
* 一份显示收入超过1000、按行业分组的账户的报告：`SUM / opportunities.amount / Greater Than / 1000`。

注：兼容EspoCRM 5.1.0版以及更高版本。

## 在仪表盘上显示报告

任何报告都可以在仪表盘上显示出来。在仪表盘显示报告的操作：添加一个“报告”组件（dashlet），然后在dashlet选项中选择要显示的报告。

## 邮件发送

系统可以定期（根据你指定的时间）地把报告结果发送给特定的用户。这种情况下，必须对某些报告进行单独的配置。

## 与目标列表同步

你可以将目标列表与列表型报告的结果进行同步。在你发送群发邮件时，如果只想向那些符合某些标准的联系人发送，那么这项功能就很方便。这项功能可以在“与报告同步”面板上的任何目标列表的细节视图中找到。
