# GENERAL
alias ll='ls -alh'

# DOCKER
alias dstopcont='sudo docker stop $(docker ps -a -q)'
alias dstopall='sudo docker stop $(sudo docker ps -aq)'
alias drmcont='sudo docker rm $(docker ps -a -q)'
alias dvolprune='sudo docker volume prune'
alias dsysprune='sudo docker system prune -a'
alias ddelimages='sudo docker rmi $(docker images -q)'
alias docerase='dstopcont ; drmcont ; ddelimages ; dvolprune ; dsysprune'
alias docprune='ddelimages ; dvolprune ; dsysprune'
alias dexec='sudo docker exec -ti'
alias docps='sudo docker ps -a'
alias dcrm='dcrun rm'
alias docdf='sudo docker system df'
alias dclogs='sudo docker logs -tf --tail="50" '
alias fixsecrets='sudo chown -R root:root /home/USER/docker/secrets ; sudo chmod -R 600 /home/USER/docker/secrets'

############################################################################
#                                                                          #
#               ------- Useful Docker Aliases --------                     #
#                                                                          #
#     # Installation :                                                     #
#     copy/paste these lines into your .bashrc or .zshrc file or just      #
#     type the following in your current shell to try it out:              #
#     wget -O - https://gist.githubusercontent.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb/raw/d84ef1741c59e7ab07fb055a70df1830584c6c18/docker-aliases.sh | bash
#                                                                          #
#     # Usage:                                                             #
#     daws <svc> <cmd> <opts> : aws cli in docker with <svc> <cmd> <opts>  #
#     dc             : docker-compose                                      #
#     dcu            : docker-compose up -d                                #
#     dcd            : docker-compose down                                 #
#     dcr            : docker-compose run                                  #
#     dex <container>: execute a bash shell inside the RUNNING <container> #
#     di <container> : docker inspect <container>                          #
#     dim            : docker images                                       #
#     dip            : IP addresses of all running containers              #
#     dl <container> : docker logs -f <container>                          #
#     dnames         : names of all running containers                     #
#     dps            : docker ps                                           #
#     dpsa           : docker ps -a                                        #
#     drmc           : remove all exited containers                        #
#     drmid          : remove all dangling images                          #
#     drun <image>   : execute a bash shell in NEW container from <image>  #
#     dsr <container>: stop then remove <container>                        #
#                                                                          #
############################################################################

function dnames_fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dip_fn {
    echo "IP addresses of all named running containers"

    for DOC in `dnames-fn`
    do
        IP=`docker inspect $DOC | grep -m3 IPAddress | cut -d '"' -f 4 | tr -d "\n"`
        OUT+=$DOC'\t'$IP'\n'
    done
    echo $OUT|column -t
}

function dex_fn {
	docker exec -it $1 ${2:-bash}
}

function di_fn {
	docker inspect $1
}

function dl_fn {
	docker logs -f $1
}

function drun_fn {
	docker run -it $1 $2
}

function dcr_fn {
	docker-compose run $@
}

function dsr_fn {
	docker stop $1;docker rm $1
}

function drmc_fn {
       docker rm $(docker ps --all -q -f status=exited)
}

function drmid_fn {
       imgs=$(docker images -q -f dangling=true)
       [ ! -z "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
}

# in order to do things like dex $(dlab label) sh
function dlab {
       docker ps --filter="label=$1" --format="{{.ID}}"
}

function dc_fn {
        docker-compose $*
}

function d_aws_cli_fn {
    docker run \
           -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
           -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
           -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
           amazon/aws-cli:latest $1 $2 $3
}

alias daws=d-_aws_cli_fn
alias dc=dc_fn
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcr=dcr_fn
alias dex=dex_fn
alias di=di_fn
alias dim="docker images"
alias dip=dip_fn
alias dl=dl_fn
alias dnames=dnames_fn
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drmc=drmc_fn
alias drmid=drmid_fn
alias drun=drun_fn
alias dsp="docker system prune --all"
alias dsr=dsr_fn