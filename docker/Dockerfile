FROM tensorflow/tensorflow:latest

# minimal software stack
RUN apt-get update
RUN apt-get install -y \
    wget \
    nano \
    less \
    htop \
    git

# python software
RUN pip install --upgrade pip
RUN pip install --upgrade ipython jupyter
RUN pip install --upgrade lbn scinum wget matplotlib scikit-learn

# create a custom home directory
RUN mkdir -p /home/user && chmod a+rwX /home/user

# add content to /etc/bash.bashrc
RUN echo '\n\n\
whoami &> /dev/null\n\
if [ "$?" != "0" ]; then\n\
    export HOME="/home/user"\n\
    export PYTHONPATH="$PYTHONPATH:$HOME/.local/lib/python2.7/site-packages"\n\
fi\n\
' >> /etc/bash.bashrc

# default jupyter port
ENV NB_PORT 8888

# default command
CMD bash -i -l -c "jupyter notebook --ip 0.0.0.0 --port $NB_PORT --no-browser"
