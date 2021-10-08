#include "foo.hpp"

int main(int argc, char *argv[])
{
    double seconds = 0;
    if(argc == 4)
    {
        int count_write = std::stoi(argv[3]);
        if(strcmp(argv[1], "Write") == 0)
        {
            if(strcmp(argv[2], "SSD/HDD") == 0)
            {
                seconds = test_memory_HDD_SSD(count_write);
            }
            else if(strcmp(argv[2], "OPR") == 0)
            {
                seconds = test_memory_oper(count_write);
            }
            else
            {
                std::cout << "Не правильные аргументы" << std::endl;
            }
        }
        else if(strcmp(argv[1], "Read") == 0)
        {
            if(strcmp(argv[2], "SSD/HDD") == 0)
            {
                seconds = Read_Test_HDD_SSD(count_write);
            }
            else if(strcmp(argv[2], "OPR") == 0)
            {
                seconds = Read_Test_OPR(count_write);    
            }
            else
            {
                std::cout << "Не правильные аргументы" << std::endl;
            }
        }
        else
        {
            std::cout << "Нет аргументов или не правильное количество аргументов" << std::endl;
        }
    }
    else
    {
        std::cout << "нет аргументов" << std::endl;
    }
    std::ofstream out;          
    out.open("time.txt");
    out << seconds;
    out.close();
    return 0;
}