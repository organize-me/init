#!/bin/sh

# This script assumes the following are installed
# * git
# * jdk 11

export START_DIR=$(pwd)

git clone git@github.com:isaiah-v/param-filter.git
cd param-filter
./gradlew clean build

cd build/libs
export FULL_NAME=$(ls -t param-filter*standalone.jar)

mkdir -p ~/bin/.jar/
cp $FULL_NAME ~/bin/.jar/param-filter.jar

cd $START_DIR
rm -rf param-filter/

cat > ~/bin/param-filter.sh << 'EOF'
#!/bin/sh
java -jar ~/bin/.jar/param-filter.jar $@
EOF

chmod +x ~/bin/param-filter.sh
