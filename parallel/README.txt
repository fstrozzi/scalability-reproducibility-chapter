GNU parallel[1] is a command line tool to run processes in parallel on
the local computer as well as on remote computers.  In the simplest
mode of operation GNU parallel accepts lines of input on the standard
input stream and runs a command on each of the input lines.

To implement a parallel version of the pipeline with GNU parallel, we
wrote a command script "proc.sh" which expects a cluster directory as
its only argument and runs the three tools sequentially on the files
in the provided directory.  The driver script "parallel.sh" generates
a list of inputs from a simple glob pattern on the data directory and
feeds it to "parallel", which runs "proc.sh" on each line in parallel.

GNU parallel distributes the work to remote machines when a list of
hosts is provided on which the user can get a remote shell session
with SSH.  It does not support submitting jobs to a cluster via a
submission host.

Unlike specialized workflow systems GNU parallel does not support
rule-based workflows.  It has no internal concept of a dependency
graph, so it cannot automatically model complicated dependencies
between intermediate output files.  In a simple setting as in this
example workflow where individual work segments are independent from
one another and their internal processes are executed sequentially,
GNU parallel can trivially make use of parallel computing resoures to
speed up the execution.

To run the example, you need to build the Docker image containing all
tools and GNU parallel itself.  Then run the driver script:

    cd /path/to/scalability-reproducibility-chapter
    docker run -w /home -v $PWD:/home ec2ab296dc99 ./parallel/parallel.sh

[1]: https://www.gnu.org/software/parallel/