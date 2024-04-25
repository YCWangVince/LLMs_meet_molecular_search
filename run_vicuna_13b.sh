export CUDA_VISIBLE_DEVICES=0,1,2,3
python3 -m fastchat.serve.controller --port 21002 &
python3 -m fastchat.serve.model_worker --model-path lmsys/vicuna-13b-v1.5-16k --controller-address http://localhost:21002 --port 22002 --worker-address http://localhost:22002 --num-gpus 4 --max-gpu-memory "23GiB" &
python3 -m fastchat.serve.openai_api_server --host localhost --port 8001 --controller-address http://localhost:21002