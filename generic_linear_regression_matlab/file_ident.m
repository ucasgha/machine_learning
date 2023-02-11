function [x_file,y_file] = file_ident(files)

[x_file,fig] = x_ident(files);
close(fig);
[y_file,fig_2] = y_ident(files);
close(fig_2);

end