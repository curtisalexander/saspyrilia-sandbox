# Python, R, Julia
FROM jupyter/datascience-notebook:latest

LABEL maintainer="Curtis Alexander <calex@calex.org>"

# .NET
# FROM mcr.microsoft.com/dotnet/core/sdk:3.1-focal

# USER $NB_UID

# ENV PATH="/home/${NB_USER}/.dotnet/tools:${PATH}"

# RUN dotnet tool install -g --add-source "https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-tools/nuget/v3/index.json" Microsoft.dotnet-interactive && \
#     dotnet interactive jupyter install && \
#     mv "${HOME}/.local/share/jupyter/kernels/.net"* "${CONDA_DIR}/share/jupyter/kernels/" && \
#     chmod -R go+rx "${CONDA_DIR}/share/jupyter" && \
#     rm -rf "${HOME}/.local" && \
#    fix-permissions "${CONDA_DIR}/share/jupyter"

# Nushell
# FROM quay.io/nushell/nu-base:latest as base
# COPY --from=base /usr/local/bin/nu /usr/local/bin/nu

# USER root

# ENV DEBIAN_FRONTEND noninteractive

# RUN apt-get update \
#     && apt-get install -y --no-install-recommends libssl-dev pkg-config \
#     && apt-get clean \
#     && rm -fr /var/lib/apt/lists/*

# USER $NB_UID

# RUN git clone https://github.com/nushell/nu_jupyter.git && \
#     cd nu_jupyter && \
#     jupyter kernelspec install ../nu_jupyter --user && \
#     mv "${HOME}/.local/share/jupyter/kernels/.net"* "${CONDA_DIR}/share/jupyter/kernels/" && \
#     chmod -R go+rx "${CONDA_DIR}/share/jupyter" && \
#     rm -rf "${HOME}/.local" && \
#     fix-permissions "${CONDA_DIR}/share/jupyter"

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