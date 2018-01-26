FROM google/cloud-sdk:alpine

RUN apk update && apk add py-pip
RUN pip install pyyaml jinja2 j2cli j2cli[yaml]

# google-cloud-sdk 内にpythonpathを通してimport可能にする
RUN mkdir -p /opt/google && \
    touch /opt/google/__init__.py && \
    ln -s /google-cloud-sdk/lib/googlecloudsdk/third_party/apis /opt/google/cloud
ENV PYTHONPATH /opt/:$PYTHONPATH
