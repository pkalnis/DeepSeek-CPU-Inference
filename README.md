# BUILD
-------

The pre-requisites to build is to get the github repo clone and run the following command:
NOTE: See the INSTALLATION directory and set PREFIX according to your choice.

bash ./build_llama_cpp.sh 

# RUN
------
There are two part of the runtime:
1. RPC servers
2. Client with the query and choice of model.

For RPC servers, submit the script server.slurm to SLURM queue. The default is two 2 independent servers but you can change that on the command line:
NOTE: Please modify the variables BASEDIR and INSTALLDIR to point to the llamp.cpp installation directory.
### for default submission
sbatch server.slurm  
### for adding more RPC servers
sbatch -n <num of servers needed> server.slurm

NOTE: After successful submission, and the job starts to run, a new file should be created in CWD called server.info.

For client, the client_node.slurm needs to be submitted with path to the chosen model in GGUF format and the llama-cli options.

sbatch client.slurm

VERY IMPORTANT: Please cancel the RPC job when you are done using these servers, otherwise it will run until the job's wall time has reached.

