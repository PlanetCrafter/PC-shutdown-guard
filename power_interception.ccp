#include <windows.h>
#include <iostream>

BOOL WINAPI ConsoleHandler(DWORD signal) {
    if (signal == CTRL_CLOSE_EVENT || signal == CTRL_SHUTDOWN_EVENT) {
        std::string password;
        std::cout << "Enter password to proceed with shutdown: ";
        std::cin >> password;

        if (password == "1234") {
            return FALSE; // Allow shutdown
        } else {
            std::cout << "Incorrect password. Shutdown aborted.\n";
            return TRUE; // Block shutdown
        }
    }
    return TRUE;
}

int main() {
    if (!SetConsoleCtrlHandler(ConsoleHandler, TRUE)) {
        std::cerr << "Error: Could not set control handler.\n";
        return 1;
    }

    std::cout << "Shutdown guard is running. Press Ctrl+C to test.\n";
    while (true) {
        Sleep(1000);
    }

    return 0;
}
