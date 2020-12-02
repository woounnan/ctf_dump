#include <memory>
#include <iostream>

int main(){
	int *j = new int;
	std::shared_ptr<int> p1(j);
	std::shared_ptr<int> s_p1(p1);

	std::cout << "###############" << std::endl;
	int *i = new int;
	std::shared_ptr<int> s_p2(i);
	std::shared_ptr<int> s_p3(i);
	int in;	
	std::cin >>in;
}
