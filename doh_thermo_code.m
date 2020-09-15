clc;
clearvars -except ETHANOL32 ETHANOL57 ETHANOL67 ETHANOL72 T_26 T_35 T_43 T_50 T_64 T_69 T_72 T_78 T_86

%part one- calibration 
type_1_AVG = [mean(T_26{:,{'1'}}); mean(T_35{:,{'1'}}); mean(T_43{:,{'1'}}); mean(T_50{:,{'1'}}); mean(T_64{:,{'1'}}); mean(T_69{:,{'1'}}); mean(T_72{:,{'1'}}); mean(T_78{:,{'1'}}); mean(T_86{:,{'1'}})];
type_2_AVG = [mean(T_26{:,{'2'}}); mean(T_35{:,{'2'}}); mean(T_43{:,{'2'}}); mean(T_50{:,{'2'}}); mean(T_64{:,{'2'}}); mean(T_69{:,{'2'}}); mean(T_72{:,{'2'}}); mean(T_78{:,{'2'}}); mean(T_86{:,{'2'}})];
type_4_AVG = [ mean(T_26{:,{'4'}}); mean(T_35{:,{'4'}}); mean(T_43{:,{'4'}}); mean(T_50{:,{'4'}}); mean(T_64{:,{'4'}}); mean(T_69{:,{'4'}}); mean(T_72{:,{'4'}}); mean(T_78{:,{'4'}}); mean(T_86{:,{'4'}})];
type_5_AVG = [ mean(T_26{:,{'5'}}); mean(T_35{:,{'5'}}); mean(T_43{:,{'5'}}); mean(T_50{:,{'5'}}); mean(T_64{:,{'5'}});mean(T_69{:,{'5'}}); mean(T_72{:,{'5'}}); mean(T_78{:,{'5'}}); mean(T_86{:,{'5'}})];
type_6_AVG = [ mean(T_26{:,{'6'}}); mean(T_35{:,{'6'}}); mean(T_43{:,{'6'}}); mean(T_50{:,{'6'}}); mean(T_64{:,{'6'}});mean(T_69{:,{'6'}}); mean(T_72{:,{'6'}}); mean(T_78{:,{'6'}}); mean(T_86{:,{'6'}})];
type_7_AVG = [ mean(T_26{:,{'7'}}); mean(T_35{:,{'7'}}); mean(T_43{:,{'7'}}); mean(T_50{:,{'7'}}); mean(T_64{:,{'7'}});mean(T_69{:,{'7'}}); mean(T_72{:,{'7'}}); mean(T_78{:,{'7'}}); mean(T_86{:,{'7'}})];
type_8_AVG = [ mean(T_26{:,{'8'}}); mean(T_35{:,{'8'}}); mean(T_43{:,{'8'}}); mean(T_50{:,{'8'}}); mean(T_64{:,{'8'}});mean(T_69{:,{'8'}}); mean(T_72{:,{'8'}}); mean(T_78{:,{'8'}}); mean(T_86{:,{'8'}})];

RTD = [ mean(T_26{:,{'9'}}); mean(T_35{:,{'9'}}); mean(T_43{:,{'9'}}); mean(T_50{:,{'9'}}); mean(T_64{:,{'9'}});mean(T_69{:,{'9'}}); mean(T_72{:,{'9'}}); mean(T_78{:,{'9'}}); mean(T_86{:,{'9'}})];

temp_cal = [26,35,43.5,50,64,69,72.5,78.5,86.5];
temp_cal_err_pos = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5];
temp_cal_err_neg = -[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5];

fit_type1 = fit(type_1_AVG,temp_cal','poly1');
fit_type2 = fit(type_2_AVG,temp_cal','poly1');
fit_type4 = fit(type_4_AVG,temp_cal','poly1');
fit_type5 = fit(type_5_AVG,temp_cal','poly1');
fit_type6 = fit(type_6_AVG,temp_cal','poly1');
fit_type7 = fit(type_7_AVG,temp_cal','poly1');
fit_type8 = fit(type_8_AVG,temp_cal','poly1');
fit_RTD = fit(RTD,temp_cal','poly1');

%בדיקת לינאריות 
% fit_type1_islin = fit(type_1_AVG,temp_cal','poly5');
% fit_type2_islin = fit(type_2_AVG,temp_cal','poly5');
% fit_type4_islin = fit(type_4_AVG,temp_cal','poly5');
% fit_type5_islin = fit(type_5_AVG,temp_cal','poly5');
% fit_type6_islin = fit(type_6_AVG,temp_cal','poly5');
% fit_type7_islin = fit(type_7_AVG,temp_cal','poly5');
% fit_type8_islin = fit(type_8_AVG,temp_cal','poly5');
% fit_RTD_islin = fit(RTD,temp_cal','poly5');
% 
figure(1);
hold on;
grid on;
title('Temprature to Voltage- type 1');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_1_AVG,temp_cal,'.');
% errorbar(type_1_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg);
plot(fit_type1);
legend('Measured results','linear fit');
hold off;

figure(2);
hold on;
grid on;
title('Temprature to Voltage- type 2');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_2_AVG,temp_cal,'.');
% errorbar(type_2_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg);
plot(fit_type2);
legend('Measured results','linear fit');
hold off;

figure(3);
hold on;
grid on;
title('Temprature to Voltage- type 4');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_4_AVG,temp_cal,'.');
% errorbar(type_4_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg);
plot(fit_type4);
legend('Measured results','linear fit');
hold off;

figure(4);
hold on;
grid on;
title('Temprature to Voltage- type 5');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_5_AVG,temp_cal,'.');
% errorbar(type_5_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg);
plot(fit_type5);
legend('Measured results','linear fit');
hold off;

figure(5);
hold on;
grid on;
title('Temprature to Voltage- type 6');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_6_AVG,temp_cal,'.');
% errorbar(type_6_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg);
plot(fit_type6);
legend('Measured results','linear fit');
hold off;

figure(6);
hold on;
grid on;
title('Temprature to Voltage- type 7');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_7_AVG,temp_cal,'.');
% errorbar(type_7_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg);
plot(fit_type7);
legend('Measured results','linear fit');
hold off;

figure(7);
hold on;
grid on;
title('Temprature to Voltage- type 8');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_8_AVG,temp_cal,'.');
% errorbar(type_8_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg);
plot(fit_type8);
legend('Measured results','linear fit');
hold off;

figure(8);
hold on;
grid on;
title('Temprature to Thermometers resistance');
xlabel('R');
ylabel('T [C]');
scatter(RTD,temp_cal,'.');
% errorbar(RTD,temp_cal,temp_cal_err_pos,temp_cal_err_neg);
plot(fit_RTD);
legend('Measured results','linear fit');
hold off;

%     %ethanol
ethanol_type_1_AVG = [mean(ETHANOL32{:,{'1'}}); mean(ETHANOL57{:,{'1'}}); mean(ETHANOL67{:,{'1'}}); mean(ETHANOL72{:,{'1'}})];
ethanol_type_2_AVG = [mean(ETHANOL32{:,{'2'}}); mean(ETHANOL57{:,{'2'}}); mean(ETHANOL67{:,{'2'}}); mean(ETHANOL72{:,{'2'}})];
ethanol_type_4_AVG = [mean(ETHANOL32{:,{'4'}}); mean(ETHANOL57{:,{'4'}}); mean(ETHANOL67{:,{'4'}}); mean(ETHANOL72{:,{'4'}})];
ethanol_type_5_AVG = [mean(ETHANOL32{:,{'5'}}); mean(ETHANOL57{:,{'5'}}); mean(ETHANOL67{:,{'5'}}); mean(ETHANOL72{:,{'5'}})];
ethanol_type_6_AVG = [mean(ETHANOL32{:,{'6'}}); mean(ETHANOL57{:,{'6'}}); mean(ETHANOL67{:,{'6'}}); mean(ETHANOL72{:,{'6'}})];
ethanol_type_7_AVG = [mean(ETHANOL32{:,{'7'}}); mean(ETHANOL57{:,{'7'}}); mean(ETHANOL67{:,{'7'}}); mean(ETHANOL72{:,{'7'}})];
ethanol_type_8_AVG = [mean(ETHANOL32{:,{'8'}}); mean(ETHANOL57{:,{'8'}}); mean(ETHANOL67{:,{'8'}}); mean(ETHANOL72{:,{'8'}})];
ethanol_RTD_AVG = [mean(ETHANOL32{:,{'9'}}); mean(ETHANOL57{:,{'9'}}); mean(ETHANOL67{:,{'9'}}); mean(ETHANOL72{:,{'9'}})];

temp_ethanol = [32,57,67,72];

fit_ethanol_type1 = fit(ethanol_type_1_AVG,temp_ethanol','poly1');
fit_ethanol_type2 = fit(ethanol_type_2_AVG,temp_ethanol','poly1');
fit_ethanol_type4 = fit(ethanol_type_4_AVG,temp_ethanol','poly1');
fit_ethanol_type5 = fit(ethanol_type_5_AVG,temp_ethanol','poly1');
fit_ethanol_type6 = fit(ethanol_type_6_AVG,temp_ethanol','poly1');
fit_ethanol_type7 = fit(ethanol_type_7_AVG,temp_ethanol','poly1');
fit_ethanol_type8 = fit(ethanol_type_8_AVG,temp_ethanol','poly1');
fit_ethanol_RTD = fit(ethanol_RTD_AVG,temp_ethanol','poly1');

fitted_ethanol_temp1 = [32.882,54.218,65.888,72.89];
fitted_ethanol_temp2 = [33.996,55.245,67.045,74.1329];
fitted_ethanol_temp4 = [32.918,56.732,66.938,72.041]; 
fitted_ethanol_temp5 = [33.21,55.27,66.3,72.918];
fitted_ethanol_temp6 = [32.721,55.501,64.613,73.725];
fitted_ethanol_temp7 = [31.579,55.471,66.331,72.847];
fitted_ethanol_temp8 = [32.171,57.719,66.235,72.622];
fitted_ethanol_tempRTD = [38.748,48.481,65.095,75.554];

fitted_vs_real_temp_type1 = fit(temp_ethanol',fitted_ethanol_temp1','poly1');
fitted_vs_real_temp_type2 = fit(temp_ethanol',fitted_ethanol_temp2','poly1');
fitted_vs_real_temp_type4 = fit(temp_ethanol',fitted_ethanol_temp4','poly1');
fitted_vs_real_temp_type5 = fit(temp_ethanol',fitted_ethanol_temp5','poly1');
fitted_vs_real_temp_type6 = fit(temp_ethanol',fitted_ethanol_temp6','poly1');
fitted_vs_real_temp_type7 = fit(temp_ethanol',fitted_ethanol_temp7','poly1');
fitted_vs_real_temp_type8 = fit(temp_ethanol',fitted_ethanol_temp8','poly1');
fitted_vs_real_temp_RTD = fit(temp_ethanol',fitted_ethanol_tempRTD','poly1');

figure(9);
hold on;
grid on;
title('Measured to Real Temprature type 1');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp1,'.');
plot(fitted_vs_real_temp_type1);
legend('Calculated results','Linear fit');
hold off;

figure(10);
hold on;
grid on;
title('Measured to Real Temprature type 2');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp2,'.');
plot(fitted_vs_real_temp_type2);
legend('Calculated results','Linear fit');
hold off;

figure(11);
hold on;
grid on;
title('Measured to Real Temprature type 4');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp4,'.');
plot(fitted_vs_real_temp_type4);
legend('Calculated results','Linear fit');
hold off;

figure(12);
hold on;
grid on;
title('Measured to Real Temprature type 5');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp5,'.');
plot(fitted_vs_real_temp_type5);
legend('Calculated results','Linear fit');
hold off;

figure(13);
hold on;
grid on;
title('Measured to Real Temprature type 6');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp6,'.');
plot(fitted_vs_real_temp_type6);
legend('Calculated results','Linear fit');
hold off;

figure(14);
hold on;
grid on;
title('Measured to Real Temprature type 7');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp7,'.');
plot(fitted_vs_real_temp_type7);
legend('Calculated results','Linear fit');
hold off;

figure(15);
hold on;
grid on;
title('Measured to Real Temprature type 8');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp8,'.');
plot(fitted_vs_real_temp_type8);
legend('Calculated results','Linear fit');
hold off;

figure(16);
hold on;
grid on;
title('Measured to Real Temprature RTD');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_tempRTD,'.');
plot(fitted_vs_real_temp_RTD);
legend('Calculated results','Linear fit');
hold off;