# BUILD
-------

The pre-requisites to build is to get the github repo clone and run the following command:
NOTE: See the INSTALLATION directory and set PREFIX according to your choice.

`git clone https://github.com/ggml-org/llama.cpp`
`bash ./build_llama_cpp.sh `
- Download GGUF file for model (e.g. using HuggingFace or similar website)

# RUN
------
There are two part of the runtime:
1. RPC servers: handle the computation work
2. Client with the query and choice of model: sends model parameters/user prompts to RPC nodes and handles communication/orchestration of work across the nodes.

For RPC servers, submit the script server.slurm to SLURM queue. By default it will launch two independent servers but you can change that on the command line:
NOTE: Please modify the variables BASEDIR and INSTALLDIR to point to the llamp.cpp installation directory.
### for default submission
`sbatch server.slurm`
### for adding more RPC servers
`sbatch -n <num of servers needed> server.slurm`

NOTE: After successful submission, and the job starts to run, a new file should be created in CWD called server.info.

For client, the client_node.slurm or benchmark.slurm file needs to be submitted with MODELDIR path modified to point to the models GGUF file and include the llama-cli options.

`sbatch client.slurm`

VERY IMPORTANT: Please cancel the RPC job when you are done using these servers, otherwise it will run until the job's wall time has reached.

