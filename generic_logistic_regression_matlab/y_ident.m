function [y_file,fig_2] = y_ident(files)

    break_loop = 0;
    fig_2 = uifigure('Name','SELECT THE FILE CONTAINING YOUR Y DATA');
    txa = uitextarea(fig_2,'FontWeight','bold','BackgroundColor',"yellow",'Value','SELECT THE DAT FILE CONTAINING YOUR Y DATA','Position',[120, 350, 310, 40]);

for i = 1:length(files)

    if break_loop == 1

        break
            
    end

    if ismissing(files(i))

        files(i) = files(i+1);

    else

        txa = uitextarea(fig_2,'Value',files(i),'Position',[220, 300, 100, 30]);
        btn = uibutton(fig_2,'push','Text','SELECT','Position',[100, 200, 150, 40],'ButtonPushedFcn',@(btn,event) SelectButtonPushed(fig_2));
        btn_2 = uibutton(fig_2,'push','Text','DO NOT SELECT','Position',[300, 200, 150, 40],'ButtonPushedFcn',@(btn_2,event) ButtonPushed(fig_2));
        uiwait(fig_2);

    end

end

function SelectButtonPushed(fig)

    y_file = files(i);
    break_loop = 1;
    uiresume(fig);

end

function ButtonPushed(fig)

    uiresume(fig);

end

end