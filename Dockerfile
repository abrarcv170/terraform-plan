FROM abrarcv170/terraform:1.0.9

LABEL "com.github.actions.name"="terra-plan"
LABEL "com.github.actions.description"="just plan terraform  action"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="violet"

LABEL version="0.1"
LABEL repository="https://github.com/abrarcv170/action/tfp"
LABEL maintainer="abrarcv170"
RUN terraform --version 
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
