# Unit testing with Unity

This sample project uses [Unity](https://www.throwtheswitch.org/unity) framework to run unit tests on C code.


> *As you may notice, Unity code is already included in this sample. If you want to get the full repository, please check https://github.com/ThrowTheSwitch/Unity.git

#### 1. **Install Required Tools**

First, ensure you have the necessary tools installed:

- **GCC**: The GNU Compiler Collection (GCC) includes `gcov`, which is used for coverage analysis.
- **CMake**: Build system tool for automate your build
- **lcov**: A graphical front-end for `gcov`.

Install them using your package manager (below on Ubuntu):

``` sh
sudo apt-get update
sudo apt-get install gcc lcov
```

#### 2. **Write Unit Tests**

This is up to you ;). An example can be found in `test/test_my_module.c`, with a passed and a failed example:
#### 3. **Build and Run Tests**

To build and run your tests, use the following command:

``` sh
./cmake_build.sh configure
./cmake_build.sh build
./cmake_build.sh build tests
```

This will compile the source and test code, link it, and execute the tests. Unity will output the results of the tests.

#### 4. **Generate the Coverage Report**

Run the following command to generate a coverage report:

``` sh
./cmake_build.sh build coverage
```

This will create a coverage report in `build/coverage/`, and will open it in a web browser. The report will show how much of your code is covered by the tests.

#### 6. **Clean Up**

To clean up the build artifacts, use:


``` sh
./cmake_build.sh clean
```
