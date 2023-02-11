function [x_file,fig] = x_ident(files)
    
    break_loop = 0; 
    fig = uifigure('Name','SELECT THE FILE CONTAINING YOUR X DATA');
    txa = uitextarea(fig,'FontWeight','bold','BackgroundColor',"yellow",'Value','SELECT THE DAT FILE CONTAINING YOUR X DATA','Position',[120, 350, 310, 40]);

for i = 1:length(files)

    if break_loop == 1

        break
            
    end

    if ismissing(files(i))

        files(i) = files(i+1);

    else

        txa = uitextarea(fig,'Value',files(i),'Position',[220, 300, 100, 30]);
        btn = uibutton(fig,'push','Text','SELECT','Position',[100, 200, 150, 40],'ButtonPushedFcn',@(btn,event) SelectButtonPushed(fig));
        btn_2 = uibutton(fig,'push','Text','DO NOT SELECT','Position',[300, 200, 150, 40],'ButtonPushedFcn',@(btn_2,event) ButtonPushed(fig));
        uiwait(fig);

    end

end

function SelectButtonPushed(fig)

    x_file = files(i);
    break_loop = 1;
    uiresume(fig);

end

function ButtonPushed(fig)

    uiresume(fig);

end

end