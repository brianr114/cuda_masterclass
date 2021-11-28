
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void exercise_one()
{
    printf("BlockID x, y, z: %d, %d, %d | BlockDim x, y , z: %d, %d, %d | GridDim x, y, z: %d, %d, %d\n",
        blockIdx.x, blockIdx.y, blockIdx.z, blockDim.x, blockDim.y, blockDim.z, gridDim.x, gridDim.y, gridDim.z);
}

int main()
{
    const int N = 4;

    dim3 block(2, 2, 2);
    dim3 grid(N / block.x, N / block.y, N / block.z);

    exercise_one <<<grid, block>>> ();

    cudaDeviceSynchronize();
    cudaDeviceReset();

    return 0;
}
