#!/bin/bash
#SBATCH --job-name=ptbxl
#SBATCH --partition=zen3_0512_a100x2 
#SBATCH --qos=zen3_0512_a100x2    
#SBATCH --account=p72515
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --time=00:50:00
#SBATCH --cpus-per-task=4    # Adjust CPU allocation
module load cuda/11.8.0-gcc-12.2.0-bplw5nu
source /home/fs72515/nadja_g/.bashrc
conda activate ecg_jepa


#python finetuning.py --model_name ejepa_random --ckpt_dir /gpfs/data/fs72515/nadja_g/ECG_JEPA_Git/ECG_JEPA/downstream_tasks/epoch100_norm.pth --dataset ptbxl --data_dir /gpfs/data/fs72515/nadja_g/ECG_JEPA/physionet/files/ptb-xl/1.0.3/ --task multilabel
python finetuning_mvo.py --model_name ejepa_random --ckpt_dir /gpfs/data/fs72515/nadja_g/ECG_JEPA_Git/ECG_JEPA/downstream_tasks/epoch75_norm_leads.pth --dataset mvo --data_dir /gpfs/data/fs72515/nadja_g/ECG_JEPA/physionet/files/ptb-xl/1.0.3/ --task multilabel