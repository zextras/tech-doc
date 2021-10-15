FROM python
ENV VIRTUAL_ENV=/docs
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .
RUN python3 -m pip install --upgrade pip
RUN pip install -r requirements.txt
