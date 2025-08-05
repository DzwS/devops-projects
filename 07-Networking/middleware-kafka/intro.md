重要的概念：Broker, Producer, Consumer, Consumer Group, Topic, Partition, Replica, Leader, Follower


----------------------- 架构介绍 -------------------
## kafka是什么 
Kafka是一个分布式事件存储和实时流媒体平台，最初由 LinkedIn 开发，对于数据量大的应用程序至关重要  
kafka本质上是一个MQ(message queue)，消息队列  
Kafka类似邮局，生产者类似邮寄者，消费者是接收者，邮局可以开设窗口，可以雇佣快递员  
[参考1](https://www.youtube.com/watch?v=QkdkLdMBuL0&pp=ygUFa2Fma2E%3D)
[参考2](https://www.youtube.com/watch?v=-RDyEFvnTXI)



##  为什么使用kafka，有什么好处
- 解耦：允许我们独立的扩展或修改队列两边的处理过程
- 可恢复性：即使一个处理消息的进程挂掉，加入队列的消息仍然可以在系统恢复后被处理
- 缓冲：有助于解决生产消息和消费消息的处理速度不一致的情况
- 灵活性&峰值处理能力：不会因为突发的超负荷的请求而完全崩溃，消息队列能够使关键组件顶住突发的访问压力
- 异步通信：消息队列允许用户把消息放入队列但不立即处理它
- 可以搭建一个事件驱动的高可用系统
- 可以配合flink搭建用户行为分析系统
- 可以做日志中心处理系统
- 消息发布和订阅，利用offset可以构建1个生产者多个消费者的情况


## 中期概括总结

----------------------- 概念解析 -------------------

## 概念解析：
- Producer: 消息生产者，向kafka broker发消息的客户端
- Consumer: 消息消费者，从kafka broker取消息的客户端
- Consumer Group: 消费组（CG），消费者组内每个消费者负责负责消费不同分区的数据，提高消费能力。一个分区只能由组件一个消费者消费，消费者组之间互不影响。所有的消费者都属于某个消费者组，即消费者组是逻辑上的一个订阅者。
- Broker: 一台kafka机器就是一个Broker。一个集群由多个Broker组成。一个Broker可以容纳多个Topic。
- Topic: 可以理解为一个队列，Topic将消息分类，生产者和消费者面向的是同一个Topic
- Partition：为了实现扩展性，提高并发能力，一个非常大的Topic可以分布到多个Broker（即服务器）上，一个Topic可以分为多个Partition，每个Partition是一个有序的队列
- Replica：副本，为实现备份的功能，保证集群中的某个节点发生故障时，该节点上的Partition的数据不丢失，Kafka仍然能够继续工作，Kafka提供了副本机制，一个Topic的每个分区都有若干个副本，一个Leader和若干个Follower
- Leader：每个分区多个副本的"主"副本，生产者发送数据的对象，以及消费者消费数据的对象，都是Leader
- Follower: 每个分区多个副本的"从"副本，实时从Leader中同步数据，保持和Leader数据的同步。Leader发生故障时，某个Follower还会成为新的Leader
- Offset：消费者消费的位置信息，监控数据消费到什么位置，当消费者挂掉再重新恢复的时候，可以从消费位置继续消费
- Zookeeper: Kafka集群能够正常哦你工作，需要依赖于Zookeeper，Zookeeper帮助Kafka存储和管理集群消息


## 部署测试
参考项目

----------------------- 机制介绍 -------------------

## 圆桌会议，原理剖析
- 为什么kafka这么快
- 存储机制
- 分区策略
- 数据可靠性保证
- 

## cheat sheet
- create topics: bin/kafka-topics.sh --bootstrap-server <URL> --create --replication-factor 3 --partitions 4 --topic topic-name
- list all topics: bin/kafka-topics.sh --bootstrap-server <URL> --list
- add a topic partition: bin/kafka-topic.sh --bootstrap-server <URL> --alert --topic <topic-name> --partitions 16
- run a producer: bin/kafka-console-producer.sh --topic <topic-name> --broker-list <URL>
- run a consumer: bin/kafka-console-consumer.sh --bootstrap-server <URL> --topic <topic-name>
- consume messages from the beginning: bin/kafka-console-consumer.sh --topic <topic-name> --bootstrap-server <URL> --group <grou-name> --from-beginning
- get information on a specific consumer group: bin/kafka-consumer-groups.sh --bootstrap-server <URL> --describe --group <group-name>
- delete a consumer group: bin/kafka-consumer-groups.sh --bootsrap-server <URL> --delete-group mygroup --group <group-name>
- reset the offset of a topic: bin/kafka-consumer-groups.sh --bootstrap-server <URL> --reset-offsets --group <group-name> --topic <topic-name> --to-earliest

## 实战经验，丰富细节