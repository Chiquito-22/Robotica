<<<<<<< HEAD
function R = Rz(psi)
%Rz realiza una rotación en un ángulo theta en radianes con respecto al eje z

R =[cosd(psi), -sind(psi), 0;
    sind(psi), cosd(psi), 0;
    0, 0, 1];
=======
function R = Rz(theta)
% Rz realiza una rotación en un ángulo theta en radianes con respecto al eje Z.
R = [cos(theta), -sin(theta), 0;
     sin(theta), cos(theta), 0;
     0, 0, 1];
end
>>>>>>> 819eefc5a62cfcd4c057ce6ba022a87a051ac44e
