#include <iostream>
#include <string>
#include <openssl/sha.h>

std::string hashPassword(const std::string& password) {
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256((unsigned char*)password.c_str(), password.size(), hash);

    std::string hashedPassword;
    for (int i = 0; i < SHA256_DIGEST_LENGTH; i++) {
        char buf[3];
        sprintf(buf, "%02x", hash[i]);
        hashedPassword += buf;
    }
    return hashedPassword;
}

int main() {
    std::string password = "1234";
    std::cout << "Hashed password: " << hashPassword(password) << std::endl;
    return 0;
}
