# ~/.config/fish/functions/top.fish
function topcpu -d "Топ процессов по использованию CPU"
    topprocs --cpu
end

function topmem -d "Топ процессов по использованию памяти"
    topprocs --mem
end
