FROM sphinxdoc/sphinx

WORKDIR /docs
ADD requirements.txt /docs
RUN /usr/local/bin/python3 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt
