# Python, R, Julia
FROM jupyter/datascience-notebook:45bfe5a474fa

LABEL maintainer="Curtis Alexander <calex@calex.org>"

USER root

ENV DEBIAN_FRONTEND noninteractive

# Add AdoptOpenJDK JDK
RUN buildDeps=' \
        gnupg \
        software-properties-common \
    ' && \
    apt-get update && \
    apt-get install -y --no-install-recommends $buildDeps && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
    rm -f /home/${NB_USER}/.wget-hsts && \
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    apt-get install -y --no-install-recommends adoptopenjdk-11-hotspot && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Add components for SAS
RUN conda install --quiet --yes \
    'saspy=3.5*' \
    'sas_kernel=2.3*' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" && \
    fix-permissions "${CONDA_DIR}/share/jupyter"

RUN jupyter kernelspec list

USER root

RUN jupyter nbextension install --py sas_kernel.showSASLog && \
    jupyter nbextension enable sas_kernel.showSASLog --py && \
    jupyter nbextension install --py sas_kernel.theme && \
    jupyter nbextension enable sas_kernel.theme --py && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" && \
    fix-permissions "${CONDA_DIR}/share/jupyter"

USER $NB_UID

COPY docker-init/mv-sascfg.sh /home/${NB_USER}
COPY docker-init/sascfg_personal.py /home/${NB_USER}
COPY docker-init/update-authinfo.sh /home/${NB_USER}

RUN echo 'oda user ODA_USER password ODA_PASSWORD' > /home/${NB_USER}/.authinfo && \
    chmod 600 /home/${NB_USER}/.authinfo

USER root

RUN chmod +x /home/${NB_USER}/mv-sascfg.sh
RUN chmod +x /home/${NB_USER}/update-authinfo.sh

USER $NB_UID

RUN /home/${NB_USER}/mv-sascfg.sh

USER $NB_UID