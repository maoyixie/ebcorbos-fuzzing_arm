# ebcorbos-fuzzing_arm
We are running on the x86_64 architecture. We use QEMU to simulate the aarch64 architecture. The compiled target binary is aarch64 architecture.
1. Create docker image
```
docker build -t ebcorbos-fuzzing_arm .
```
2. Create container
```
docker run -it -d --name ebcorbos-fuzzing_arm ebcorbos-fuzzing_arm
```
3. Enter container
```
docker exec -it ebcorbos-fuzzing_arm /bin/bash
```
4. Begin fuzzing
```
afl-fuzz -Q -i input -o output ./char_arr_to_vec_target @@
```
