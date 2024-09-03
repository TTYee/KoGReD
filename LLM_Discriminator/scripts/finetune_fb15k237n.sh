export WANDB_DISABLED=true
wandb offline
CUDA_VISIBLE_DEVICES=0 nohup python finetune_kopa.py \
    --base_model 'baffo32/decapoda-research-llama-7B-hf' \ 
    --data_path 'data/FB15K-237N-train.json' \
    --output_dir 'output/llama_fb' \
    --num_epochs 3 \
    --lora_r 64 \
    --learning_rate 3e-4 \
    --batch_size 8 \
    --micro_batch_size 8 \
    --num_prefix 1 \
    --kge_model 'data/FB15K-237N-rotate.pth' \
    --lora_target_modules='[q_proj,k_proj,v_proj,o_proj]' > log_llama_fb.txt &