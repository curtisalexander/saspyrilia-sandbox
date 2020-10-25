# Python, R, Julia
FROM jupyter/datascience-notebook:latest

LABEL maintainer="Curtis Alexander <calex@calex.org>"

USER root

ENV DEBIAN_FRONTEND noninteractive

# Add AdoptOpenJDK for use with SAS IOM
RUN buildDeps=' \
        gnupg \
        software-properties-common \
    ' && \
    apt-get update && \
    apt-get install -y --no-install-recommends $buildDeps && \
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
    rm -f /home/${NB_USER}/.wget-hsts && \
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    apt-get install -y --no-install-recommends adoptopenjdk-11-hotspot && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Add SQLite
RUN apt-get update && \
    apt-get install -y --no-install-recommends sqlite && \
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

USER root

# Add notebook extensions
RUN jupyter nbextension install --py sas_kernel.showSASLog && \
    jupyter nbextension enable sas_kernel.showSASLog --py && \
    jupyter nbextension install --py sas_kernel.theme && \
    jupyter nbextension enable sas_kernel.theme --py && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" && \
    fix-permissions "${CONDA_DIR}/share/jupyter"

USER $NB_UID

# Add Julia packages
RUN julia -e 'import Pkg; Pkg.update()' && \
    julia -e "using Pkg; pkg\"add Queryverse, DataFrames\"; pkg\"precompile\"" && \
    fix-permissions "${JULIA_PKGDIR}" "${CONDA_DIR}/share/jupyter"

# Add scripts
RUN mkdir -p /home/${NB_USER}/bin

COPY --chown=${NB_USER}:users docker/mv-sascfg.sh /home/${NB_USER}/bin
COPY --chown=${NB_USER}:users docker/sascfg_personal.py /home/${NB_USER}/bin
COPY --chown=${NB_USER}:users docker/update-authinfo.sh /home/${NB_USER}/bin

RUN chmod +x /home/${NB_USER}/bin/mv-sascfg.sh && \
    chmod +x /home/${NB_USER}/bin/update-authinfo.sh

RUN echo 'oda user ODA_USER password ODA_PASSWORD' > /home/${NB_USER}/.authinfo && \
    chmod 600 /home/${NB_USER}/.authinfo

RUN /home/${NB_USER}/bin/mv-sascfg.sh && \
    rm -f /home/${NB_USER}/bin/mv-sascfg.sh