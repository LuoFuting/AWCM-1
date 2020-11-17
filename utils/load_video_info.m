function [seqrgb,seqt,ground_truthR,ground_truthT] = load_video_info(video_path)
%% load rgb
ground_truthR = dlmread([video_path '/visible.txt']);
ground_truthT = dlmread([video_path '/infrared.txt']);


seqrgb.format = 'otb';
seqrgb.len = size(ground_truthR, 1);
seqrgb.init_rect = ground_truthR(1,:);

imgrgb_path = [video_path '/visible/'];

imgrgb_files = dir(fullfile(imgrgb_path, '*.jpg'));
imgrgb_files = {imgrgb_files.name};


%% load t
seqt.format = 'otb';
seqt.len = size(ground_truthT, 1);
seqt.init_rect = ground_truthT(1,:);

imgt_path = [video_path '/infrared/'];

imgt_files = dir(fullfile(imgt_path, '*.jpg'));
imgt_files = {imgt_files.name};


for i=1:1:seqrgb.len
    imgt_files{i}=[imgt_path,imgt_files{i}];
    imgrgb_files{i}=[imgrgb_path,imgrgb_files{i}];
end

seqt.s_frames = cellstr(imgt_files);
seqrgb.s_frames = cellstr(imgrgb_files);

end

