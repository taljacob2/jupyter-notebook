# Prepare python and pip.
FROM jupyter/minimal-notebook AS base

# Upgrade pip.
RUN pip install --upgrade pip

# Install optional jupyter themes.
RUN pip install --no-cache-dir jupyterlab_darkside_theme jupyterlab-night

# -----------------------------------------------------------------------------
FROM base AS base-with-requirements

# Prepare workspace.
WORKDIR /workspace

# Create virtual environment.
RUN python3 -m venv .venv

# Switch to the virtual environment.
ENV PATH="/workspace/.venv/bin:$PATH"

# Install requirements.txt.
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# -----------------------------------------------------------------------------
FROM base-with-requirements AS image

COPY . .

# Start jupyter notebook server entrypoint, without token.
EXPOSE 8888
ENTRYPOINT ["jupyter", "notebook", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--NotebookApp.token="]
