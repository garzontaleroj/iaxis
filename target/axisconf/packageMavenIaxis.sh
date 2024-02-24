rm -rf target/*
rm -rf build/*
mvn clean install
zip -d build/target/axisconf.war build/\*
zip -d build/target/axisconf.war target/\*
zip -d build/target/axisconf.war .settings/\*
zip -d build/target/axisconf.war WEB-INF/xlib/\ojdbc*.jar
rm -rf target/*
mv build/target/axisconf.war target/axisconf.war
rm -rf build/*
rm -rf /home/trikismikis/Projets/Confianza/CDAzure/dockeriaxis-prd/deploy/axisconf.war
cp target/axisconf.war /home/trikismikis/Projets/Confianza/CDAzure/dockeriaxis-prd/deploy/axisconf.war
cd /home/trikismikis/Projets/Confianza/CDAzure/dockeriaxis-prd/
./deployAxis.sh
