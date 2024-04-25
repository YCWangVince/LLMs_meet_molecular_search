export CUDA_VISIBLE_DEVICES=0,1,2,3
python3 -m fastchat.serve.controller --port 21001 &
python3 -m fastchat.serve.model_worker --model-path lmsys/vicuna-7b-v1.5-16k --controller-address http://localhost:21001 --port 22001 --worker-address http://localhost:22001 --num-gpus 4 --max-gpu-memory "23GiB" &
python3 -m fastchat.serve.openai_api_server --host localhost --port 8000 --controller-address http://localhost:21001