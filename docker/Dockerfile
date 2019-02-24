FROM tensorflow/tensorflow:latest

# copy the adjusted system bashrc
COPY bashrc /etc/bash.bashrc

# default jupyter notebook port
ENV NB_PORT 8888

# minimal software stack
RUN apt-get update
RUN apt-get install -y wget nano less htop git

# python software
RUN pip install --upgrade pip
RUN pip install --upgrade ipython jupyter
RUN pip install --upgrade lbn scinum wget matplotlib scikit-learn

# create a custom home directory
RUN mkdir -p /home/user && chmod a+rwX /home/user

# default command (run_tutorial is defined in bashrc)
CMD bash -i -l -c run_tutorial
