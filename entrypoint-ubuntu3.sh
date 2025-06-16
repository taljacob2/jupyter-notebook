#!/bin/bash
nohup tensorboard --logdir=model_checkpoints --host=0.0.0.0 &
nohup jupyter notebook --allow-root --no-browser --ip=0.0.0.0 --port=8888 --NotebookApp.token=''
