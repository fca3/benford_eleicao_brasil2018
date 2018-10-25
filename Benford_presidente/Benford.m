function [Abs, Percent] = Benford(InputVector)

Stat(1:9) = 0;

for i = 1:length(InputVector)
    string = sprintf('%0.5e', abs(InputVector(i)));
    firstDigit = str2double(string(1));
    switch firstDigit
        case 1
            Stat(1) = Stat(1) +1;
        case 2
            Stat(2) = Stat(2) +1;
        case 3
            Stat(3) = Stat(3) +1;
        case 4
            Stat(4) = Stat(4) +1;
        case 5
            Stat(5) = Stat(5) +1;
        case 6
            Stat(6) = Stat(6) +1;
        case 7
            Stat(7) = Stat(7) +1;
        case 8
            Stat(8) = Stat(8) +1;
        case 9
            Stat(9) = Stat(9) +1;
    end
end

Abs = Stat;
Percent = Stat / length(InputVector);

end
