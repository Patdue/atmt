# Train a sentencepiece model.
spm_train --input=../data/train.de,../data/train.en --model_prefix=joint_spm --vocab_size=8000

# Encode our training data into subwords.
spm_encode --model=joint_spm.model --output_format=piece < ../data/train.de > preprocessed/train.de
spm_encode --model=joint_spm.model --output_format=piece < ../data/train.en > preprocessed/train.en

spm_encode --model=joint_spm.model --output_format=piece < ../data/valid.de > preprocessed/valid.de
spm_encode --model=joint_spm.model --output_format=piece < ../data/valid.en > preprocessed/valid.en

spm_encode --model=joint_spm.model --output_format=piece < ../data/test.de > preprocessed/test.de
spm_encode --model=joint_spm.model --output_format=piece < ../data/test.en > preprocessed/test.en

spm_encode --model=joint_spm.model --output_format=piece < ../data/tiny_train.de > preprocessed/tiny_train.de
spm_encode --model=joint_spm.model --output_format=piece < ../data/tiny_train.en > preprocessed/tiny_train.en

# We intentionally skip truecasing  & normalization for now, to compare the basline against sentence piece only.

# Prepare data for training
python ../../preprocess.py --target-lang en --source-lang de --dest-dir prepared --train-prefix preprocessed/train --valid-prefix preprocessed/valid --test-prefix preprocessed/test --tiny-train-prefix preprocessed/tiny_train --threshold-src 1 --threshold-tgt 1 --num-words-src 8000 --num-words-tgt 8000
