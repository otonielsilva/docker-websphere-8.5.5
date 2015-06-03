yum -y install unzip

groupadd was
useradd wasuser -g was

mkdir -p /opt/software/IBM/installer-package
mkdir -p /opt/software/IBM/was
mkdir -p /opt/WebSphere85/

unzip /tmp/agent.installer.linux.gtk.x86_64*.zip -d /opt/software/IBM/installer-package && \
    unzip /tmp/was.repo.8550.developers.ilan_part1.zip -d /opt/software/IBM/was && \
    unzip /tmp/was.repo.8550.developers.ilan_part2.zip -d /opt/software/IBM/was && \
    unzip /tmp/was.repo.8550.developers.ilan_part3.zip -d /opt/software/IBM/was

#Install Package Manager
/opt/software/IBM/installer-package/installc  -acceptLicense -accessRights admin -installationDirectory "/opt/WebSphere85/IMGR" -dataLocation "/opt/WebSphere85/Imdata" -silent  



#Install WAS
# /opt/WebSphere85/IMGR/eclipse/tools/imcl listAvailablePackages -repositories /opt/software/IBM/was/repository.config
# [get the output and use that string in the next install command e.g. com.ibm.websphere.BASE.v85_8.5.0.20120501_1108]
/opt/WebSphere85/IMGR/eclipse/tools/imcl \
     -acceptLicense \
     -showProgress install com.ibm.websphere.DEVELOPERSILAN.v85_8.5.5000.20130514_1044 \
     -repositories  /opt/software/IBM/was/repository.config 


#create a default profile
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh \
     -create \
     -templatePath /opt/IBM/WebSphere/AppServer/profileTemplates/default/ \
     -cellName cell1 -nodeName node1 -serverName server1 \
     -hostName localhost

rm -rf /opt/software
rm -rf /tmp/was.repo.8550.developers.ilan_part*.zip
rm -rf /opt/WebSphere85/
rm -rf /tmp/agent.installer.linux.gtk.x86_64*.zip

