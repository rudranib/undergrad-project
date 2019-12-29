datapath='/Users/rudranibhadra/Downloads/revid';
videoformat = 'MOV';
files = dir([datapath '/' '*.' videoformat]);
filecount = size({files.name},2);
filenames = {files.name};
output_filename = 'feature_2.csv';
n=1;
i=1;
num_frames = 10; %The desired video length
frame_features=cell(filecount,num_frames);
all_features=cell((filecount*num_frames),1);
%all_features = cell{[filecount num_frames]};
%all_features = {[filecount num_frames]};
for q = 1:filecount
    movieFullFileName = fullfile(datapath,char(filenames(q)));
    videoObject = VideoReader(movieFullFileName);
    numberOfFrames = videoObject.NumberOfFrames;
   
    for frame = 1 : num_frames
        
        thisFrame = read(videoObject, frame);
        
        %rgb_frame = double(cf(thisFrame));
        rgb_frame = cf(thisFrame);
        %mlbp_out = lbp(rgb_frame);
        %cm_out = cmm(rgb_frame);
        %olbp_out = olbp(thisFrame);
        all_out = allfunc(rgb_frame);
        %frame_features{q,frame} = cm_out;
        %frame_features{q,frame} = mlbp_out;
        %frame_features{q,frame} = olbp_out;
        frame_features{q,frame} = all_out;
        %all_features{n,1} = cm_out;
        %all_features{n,1} = olbp_out;
        all_features{n,1} = all_out;
       % all_features{n,1} = mlbp_out;
        all_features{n,2}=1;
        
      n=n+1;
       disp(i);
      i=i+1;
    end
    
end
out_features=cell2mat(all_features);
o_f=cell2mat(frame_features);
%{
D=cellfun(@transpose, frame_features,'UniformOutput',false);
D=reshape(frame_features,1,10).';
out = cell2mat(cellfun(@(x) cell2mat(x),frame_features,'UniformOutput',false));
out_features = reshape(out,[filecount*num_frames,6]);
out_features = (reshape(out,[6,filecount*num_frames]))';
xlswrite('file2.xls', out_features);
csvwrite(output_filename,out_features); 
%}
save('f2.mat','out_features');
save('f22.mat','frame_features');
%csvwrite('f2.csv', o_f);

