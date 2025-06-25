# run dalam root

# kita update dan upgrade sistem linux nya
apt update
apt upgrade -y

# kita akan install python3 environment terlebih dahulu
apt install python3-venv
python3 -m venv .env
source .env/bin/activate

# install macem-macem
pip install keras
pip install tensorflow
pip install transformers
pip install sentence-transformers
pip install 'transformers[torch]'
pip install diffusers["torch"] transformers
