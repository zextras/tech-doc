FROM python

WORKDIR /docs
ADD requirements.txt /docs
ADD source/suite /docs/source/
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
