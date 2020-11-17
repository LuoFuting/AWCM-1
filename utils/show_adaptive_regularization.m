if frame > 1
    
    bias{1} = real(min(r{1}(:,:,1)));
    bias{2} = real(min(r{2}(:,:,1)));
  
 
end
if (frame>1||mod(frame,update_interval)==0)&&params.show_regularization
  %
    figure(2);
 
    for k=1:1:2
       r233{k}=real(r{k}); 
    clear gca   
    I{k}=im{k};
    init_rect{k} = rect_position{k}(loop_frame,:);
    I{k} = insertShape(I{k}, 'Rectangle', init_rect{k}, 'LineWidth', 2, 'Color', 'red');
    padding = 2.0;
    rect_paddding{k} = [init_rect{k}(1)-init_rect{k}(3)*padding/2,...
    init_rect{k}(2)-init_rect{k}(4)*padding/2,...
    init_rect{k}(3)*(1+padding),init_rect{k}(4)*(1+padding)];
    
    crop{k} = imresize(imcrop(I{k}, rect_paddding{k}), [125, 125]);
    [h{k}, width{k}, c] = size(crop{k});

   % startw{k}=round(size(w{k},1)*0.4/2)+1;
  %  starth{k}=round(size(w{k},2)*0.4/2)+1;
 %  w_{k}=w{k}(startw{k}:startw{k}+round(size(w{k},1)*0.6)-1,starth{k}:starth{k}+round(size(w{k},2)*0.6)-1);
  %  w_{k}=imresize(w_{k},[h{k},width{k}]);
   
     startw{k}=round(size(r233{k}(:,:,1),1)*0.4/2)+1;
   starth{k}=round(size(r233{k}(:,:,1),2)*0.4/2)+1;
   w_{k}=r233{k}(startw{k}:startw{k}+round(size(r233{k}(:,:,1),1)*0.6)-1,starth{k}:starth{k}+round(size(r233{k}(:,:,1),2)*0.6)-1);
    w_{k}=imresize(w_{k},[h{k},width{k}]);
   
    
    
   % w_{k}=(w._{k}-bias{2}+0.1);
    surf(w_{k});
    g{k} = hgtransform('Matrix',makehgtform('translate',[0 0 0]));
    
    subplot(1,2,k)
    
     image(g{k}, crop{k}) 
    
     if k==1
   view(205, 30)
  % axis off
     end
     
     
     
    end
     
    
    
    
  
    set(gcf, 'position', [0 0 1200 520], 'Color',[1,1,1]);  
 
    
    
end   