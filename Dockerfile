FROM python:3.8-slim

ARG DEVEL=no

WORKDIR /notebooks

COPY requirements /tmp/requirements

RUN set -x \
    && if [ "$DEVEL" = "yes" ]; then pip --no-cache-dir --disable-pip-version-check \
        install -r /tmp/requirements/dev.txt; fi

RUN set -x \
    && pip --no-cache-dir --disable-pip-version-check \
        install -r /tmp/requirements/main.txt

COPY notebooks .

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

