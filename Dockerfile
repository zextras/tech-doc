FROM python

WORKDIR /docs
ADD requirements.txt /docs
ADD build /docs/build
COPY source /docs/source
COPY source/suite /docs/source/suite
COPY source/landing /docs/source/landing
COPY source/carbonio /docs/source/carbonio
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m sphinx source/suite build/suite
RUN python -m sphinx source/landing build/landing
RUN python -m sphinx source/carbonio build/carbonio
