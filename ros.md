em 'module' object has no attribute 'Interpreter'
solved:
    pip uninstall em
    pip install empy

## nodelet用法:
    nodelet manager               - Launch a nodelet manager node.  启动一个manager
    nodelet load pkg/Type manager - Launch a nodelet of type pkg/Type on manager manager. 向manager中加载nodelet
    nodelet standalone pkg/Type   - Launch a nodelet of type pkg/Type in a standalone node. 
    nodelet unload name manager   - Unload a nodelet a nodelet by name from manager. 从manager中移除nodelet

    开启一个名字为nodelet_manager的manager节点:
    rosrun nodelet nodelet manager __name:=nodelet_manager

    向创建的nodelet_manager中加载pkg/Type为nodelet_tutorial_math/Plus的nodelet节点，并将其重命名为nodelet1，nodelet1/in话题重映射为foo，value值设为1.1:
    rosrun nodelet nodelet load nodelet_tutorial_math/Plus nodelet_manager __name:=nodelet1 nodelet1/in:=foo _value:=1.1


ros报错:

    m_subscriber = g_nh->subscribe(TOPIC_NAME_SCHEDULE, 10, &CSubscribeTask::schedeleCallback, this);
    while (!m_bExit && ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();
        sleep(1);
    }

terminate called after throwing an instance of 'boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<boost::lock_error> >'
  what():  boost: mutex lock failed in pthread_mutex_lock: 无效的参数
已放弃 (核心已转储)

解决方法:
把m_subscriber改成局部变量就好, 问题不详
