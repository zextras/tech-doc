FROM debian

RUN python \
    python-pip \

RUN pip install virtualenv

CMD ["/bin/bash"]
