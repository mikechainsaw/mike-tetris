TARGET=tetris
CXX=g++
DEBUG=-g
OPT=-O0
WARN=-Wall
SFML=-lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lfreetype -lwinmm -lgdi32 -lsfml-main
CXXFLAGS=$(DEBUG) $(OPT) $(WARN) $(SFML)
LD=g++
OBJS= main.o tetris.o
SFMLPath=C:\SFML
all: compile link

compile: main tetris

main: 
	g++ -c src\main.cpp -I"$(SFMLPath)\include" -DSFML_STATIC

tetris: 
	g++ -c src\tetris.cpp -I"$(SFMLPath)\include" -DSFML_STATIC

link: 
	g++ $(OBJS) -o $(TARGET) -L"$(SFMLPath)\lib" $(SFML)

clean:
	@rm -f *.o
	@./$(TARGET)