cat ../spm/preprocessed/train.de ../spm/preprocessed/train.en > preprocessed/train.de
cat ../spm/preprocessed/train.en ../spm/preprocessed/train.en > preprocessed/train.en

ln ../spm/preprocessed/test.de preprocessed/test.de
ln ../spm/preprocessed/test.en preprocessed/test.en

ln ../spm/preprocessed/valid.de preprocessed/valid.de
ln ../spm/preprocessed/valid.en preprocessed/valid.en

ln ../spm/preprocessed/tiny_train.de preprocessed/tiny_train.de
ln ../spm/preprocessed/tiny_train.en preprocessed/tiny_train.en

python ../../preprocess.py --target-lang en --source-lang de --dest-dir prepared --train-prefix preprocessed/train --valid-prefix preprocessed/valid --test-prefix preprocessed/test --tiny-train-prefix preprocessed/tiny_train --threshold-src 1 --threshold-tgt 1 --num-words-src 8000 --num-words-tgt 8000

