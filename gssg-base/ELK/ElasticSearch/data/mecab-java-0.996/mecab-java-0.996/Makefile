TARGET=MeCab
JAVAC=javac
JAVA=java
JAR=jar
CXX=c++
#INCLUDE=/usr/lib/jvm/java-6-openjdk/include
INCLUDE=/usr/lib/jvm/java-1.8.0-openjdk-amd64

PACKAGE=org/chasen/mecab

LIBS=`mecab-config --libs`
INC=`mecab-config --cflags` -I$(INCLUDE) -I$(INCLUDE)/linux

#    # OpenJDK 사용시 "-O1" 로 변경. ; $(CXX) -O1 -c -fpic $(TARGET)_wrap.cxx  $(INC)
#    # "-cp ." 추가.                 ; $(JAVAC) -cp . test.java
all:
	$(CXX) -O1 -c -fpic $(TARGET)_wrap.cxx  $(INC)
	$(CXX) -shared  $(TARGET)_wrap.o -o lib$(TARGET).so $(LIBS)
	$(JAVAC) $(PACKAGE)/*.java
	$(JAVAC) -cp . test.java
	$(JAR) cfv $(TARGET).jar $(PACKAGE)/*.class

test:
	env LD_LIBRARY_PATH=. $(JAVA) test

clean:
	rm -fr *.jar *.o *.so *.class $(PACKAGE)/*.class

cleanall:
	rm -fr $(TARGET).java *.cxx
