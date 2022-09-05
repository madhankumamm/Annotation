FROM gitpod/workspace-python

ENV pip_packages "shyaml==0.6.2 pre-commit==2.19.0 gunicorn==20.1.0 black==22.3.0 pylint==2.13.9"

# Install aws-cli
RUN sudo apt-get update; \
    sudo apt-get install -y ; \
    wget "https://awscli.amazonaws.com/awscli-exe-linux-"$(uname -m)".zip" -O "awscliv2.zip" ; \
    unzip awscliv2.zip; \
    sudo ./aws/install; \
    rm awscliv2.zip; \
    pip install -U pip; \
    pip install $pip_packages --no-cache-dir; \
    rm -r ./aws; \
    # Clean up
    sudo apt-get autoremove -y ; \
    sudo apt-get clean -y ; \
    sudo rm -rf /var/lib/apt/lists/* ;
