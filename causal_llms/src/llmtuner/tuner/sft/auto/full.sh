nohup bash -c 'CUDA_VISIBLE_DEVICES=2 python src/train_bash.py \
    --stage fl_sft \
    --model_name_or_path meta-llama/Llama-2-7b \
    --do_train \
    --dataset alpaca_gpt4_en \
    --template default \
    --finetuning_type full \
    --output_dir ./outputs/llama2-7b \
    --overwrite_cache \
    --per_device_train_batch_size 2 \
    --per_device_eval_batch_size 2 \
    --gradient_accumulation_steps 8 \
    --lr_scheduler_type cosine \
    --logging_steps 1 \
    --save_steps 9000 \
    --val_size 500 \
    --eval_steps 200 \
    --evaluation_strategy steps \
    --learning_rate 1e-6 \
    --num_train_epochs 3 \
    --overwrite_output_dir \
    --plot_loss \
    --switch_block_every 300 \
    --switch_mode full \
    --bcd_epochs 6 \
    --num_clients 64 \
     > alpaca_full.log 2>&1' &

nohup bash -c 'CUDA_VISIBLE_DEVICES=4 python src/train_bash.py \
    --stage fl_sft \
    --model_name_or_path meta-llama/Llama-2-7b \
    --do_train \
    --dataset oaast_sft \
    --template default \
    --finetuning_type flblock \
    --output_dir ./outputs/llama2-7b \
    --overwrite_cache \
    --per_device_train_batch_size 2 \
    --per_device_eval_batch_size 2 \
    --gradient_accumulation_steps 8 \
    --lr_scheduler_type cosine \
    --logging_steps 1 \
    --save_steps 9000 \
    --val_size 500 \
    --eval_steps 200 \
    --evaluation_strategy steps \
    --learning_rate 1e-6 \
    --num_train_epochs 3 \
    --overwrite_output_dir \
    --plot_loss \
    --switch_block_every 300 \
    --switch_mode full \
    --bcd_epochs 6 \
    --num_clients 64 \
     > oaast_full.log 2>&1' &

nohup bash -c 'CUDA_VISIBLE_DEVICES=4 python src/train_bash.py \
    --stage pt \
    --model_name_or_path meta-llama/Llama-2-7b \
    --do_train \
    --dataset wikipedia_en \
    --template default \
    --finetuning_type block \
    --output_dir ./outputs/llama2-7b \
    --overwrite_cache \
    --per_device_train_batch_size 64 \
    --per_device_eval_batch_size 32 \
    --gradient_accumulation_steps 8 \
    --lr_scheduler_type cosine \
    --logging_steps 1 \
    --save_steps 1000 \
    --eval_steps 200 \
    --evaluation_strategy steps \
    --learning_rate 1e-6 \
    --num_train_epochs 3 \
    --overwrite_output_dir \
    --plot_loss \
    --switch_block_every 100 \
     > pt_full.log 2>&1' &