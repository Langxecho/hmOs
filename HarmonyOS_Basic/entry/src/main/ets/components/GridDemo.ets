
@Component
export struct GridDemo{
  @State assignments: Assignment[] = [
    { title: '数学作业', deadline: '2025-09-15', status: 'pending' },
    { title: 'Java编程', deadline: '2025-09-16', status: 'completed' },
    { title: '英语作文', deadline: '2025-09-17', status: 'pending' },
    { title: '物理实验', deadline: '2025-09-18', status: 'overdue' },
    { title: '化学报告', deadline: '2025-09-19', status: 'pending' },
    { title: '历史论文', deadline: '2025-09-20', status: 'completed' }
  ];

  build() {
    Grid(){
      ForEach(this.assignments,(assignment: Assignment) => {
        GridItem(){
          Column({space: 8}){
            Text(assignment.title)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#2C3E50')
              .textAlign(TextAlign.Center)
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Text(this.getIconByStatus(assignment.status))
              .fontSize(20)
              .textAlign(TextAlign.Center)
            
            Text(this.getStatusText(assignment.status))
              .fontSize(12)
              .fontColor(this.getColorByStatus(assignment.status))
              .fontWeight(FontWeight.Medium)
              .textAlign(TextAlign.Center)

            Text(assignment.deadline)
              .fontSize(11)
              .fontColor('#95A5A6')
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height(120)
          .padding(12)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .shadow({
            radius: 4,
            color: '#E0E0E0',
            offsetX: 0,
            offsetY: 2
          })
        }
      })
    }
    .columnsTemplate('1fr 1fr')
    .rowsTemplate('auto auto auto')
    .columnsGap(12)
    .rowsGap(12)
    .width('100%')
    .height(400)
    .padding(4)
  }

  getIconByStatus(status: string):string {
    switch (status){
      case 'completed':
        return '✅'; // 已完成
      case 'pending':
        return '📝'; // 待完成
      case 'overdue':
        return '⚠'; // 已逾期
      default:
        return '📋';
    }
  }

  getColorByStatus(status: string):string {
    switch (status){
      case 'completed':
        return '#27AE60'; // 已完成
      case 'pending':
        return '#F39C12'; // 待完成
      case 'overdue':
        return '#E74C3C'; // 已逾期
      default:
        return '#95A5A6';
    }
  }

  getStatusText(status: string):string {
    switch (status){
      case 'completed':
        return '已完成';
      case 'pending':
        return '待完成';
      case 'overdue':
        return '已逾期';
      default:
        return '未知';
    }
  }
}

interface Assignment {
  title: string;
  deadline: string;
  status: string;
}