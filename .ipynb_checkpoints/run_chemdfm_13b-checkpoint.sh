export CUDA_VISIBLE_DEVICES=0,1,2,3
python3 -m fastchat.serve.controller --port 21003 &
python3 -m fastchat.serve.model_worker --model-path OpenDFM/ChemDFM-13B-v1.0 --controller-address http://localhost:21003 --port 22003 --worker-address http://localhost:22003 --num-gpus 4 --max-gpu-memory "23GiB" &
python3 -m fastchat.serve.openai_api_server --host localhost --port 8002 --controller-address http://localhost:21003