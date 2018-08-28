mvn clean install -e -U
-e详细异常，-U强制更新

for /r %i in (*.lastUpdated)do del %i
删掉扩展为.lastupdate的文件，这些文件都是maven在下载过程中下载失败了且在本地存在的jar文件，但是其存在影响你下载这些jar文件的时候，造成无法去中央仓库下载的干扰。

mvn install:install-file -Dfile=jar包的位置 -DgroupId=上面的groupId -DartifactId=上面的artifactId -Dversion=上面的version -Dpackaging=jar
手动添加本地jar

导出Project依赖的jar包
mvn dependency:copy-dependencies -DoutputDirectory=lib
