function [alpha] = rate_ident()

fig_3 = uifigure('Name','SELECT THE LEARNING RATE');
txa = uitextarea(fig_3,'FontWeight','bold','BackgroundColor',"yellow",'Value','ENTER YOUR LEARNING RATE','Position',[180, 350, 190, 40]);
txa_2 = uitextarea(fig_3,'Position',[220, 300, 100, 30]);
btn = uibutton(fig_3,'push','Text','ENTER','Position',[195, 200, 150, 40],'ButtonPushedFcn',@(btn,event) ButtonPushed(txa_2,fig_3));
uiwait(fig_3);


function ButtonPushed(txa_2,fig_3)

   alpha = txa_2.Value; 
   alpha = str2double(cell2mat(alpha));
   uiresume(fig_3);
   close(fig_3);

end 

end