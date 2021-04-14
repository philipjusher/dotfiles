


docker run -it --rm --user root\
      	   -e HOST_USER_ID=$(id -u ${USER}) \
           -e HOST_GROUP_ID=$(id -g ${USER}) \
	   --mount type=bind,source=${PWD},target=${PWD}\
	   --mount type=bind,source=${HOME}/.ssh,target=/home/Devbox/.ssh\
	   -e TERM="xterm-256color" \
	   -w ${PWD} \
	   -v /var/run/docker.sock:/var/run/docker.sock \
	   dev-box

