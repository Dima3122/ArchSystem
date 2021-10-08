#include<iostream>
#include<fstream>
#include<string>
using namespace std;

int main()
{    
    int n = 0; //n is the number of the integers in the file ==> 12
    double arr[100];

    ifstream File;
    File.open("time2.txt", std::ifstream::in);
    while(!File.eof())
    {
        File >> arr[n];
        n++;
    }
    File.close();
    double med_arif = (arr[0] + arr[1] + arr[2])/3;
    ofstream out;          
    out.open("time.txt");
    out << med_arif;
    out.close();
    return 0;
}