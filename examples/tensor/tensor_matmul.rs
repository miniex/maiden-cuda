use maiden_cuda::prelude::*;

fn main() -> CudaResult<()> {
    let data1 = vec![vec![1.0, 2.0], vec![3.0, 4.0]];
    let tensor1 = Tensor::new(data1)?;

    let data2 = vec![vec![5.0, 6.0], vec![7.0, 8.0]];
    let tensor2 = Tensor::new(data2)?;

    let result = tensor1.matmul(&tensor2)?;
    println!("Result:\n{}", result);

    Ok(())
}
