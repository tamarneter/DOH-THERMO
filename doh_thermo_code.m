close all;
clc;
clearvars -except ETHANOL32 ETHANOL57 ETHANOL67 ETHANOL72 T_26 T_35 T_43 T_50 T_64 T_69 T_72 T_78 T_86 MEDIDOTDINAMIOT1 MEDIDOTDINAMIOT2 MEDIDOTDINAMIOT3

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
temp_cal_err_pos = 2*[1,1,1,1,1,1,1,1,1];
temp_cal_err_neg = 2*[1,1,1,1,1,1,1,1,1];
volt_err_pos = [0.00001,0.00001,0.00001,0.00001,0.00001,0.00001,0.00001,0.00001,0.00001];
volt_err_neg = [0.00001,0.00001,0.00001,0.00001,0.00001,0.00001,0.00001,0.00001,0.00001];
RTD_err_pos = [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
RTD_err_neg = [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];

fit_type1 = fit(type_1_AVG,temp_cal','poly1');
fit_type2 = fit(type_2_AVG,temp_cal','poly1');
fit_type4 = fit(type_4_AVG,temp_cal','poly1');
fit_type5 = fit(type_5_AVG,temp_cal','poly1');
fit_type6 = fit(type_6_AVG,temp_cal','poly1');
fit_type7 = fit(type_7_AVG,temp_cal','poly1');
fit_type8 = fit(type_8_AVG,temp_cal','poly1');
fit_RTD = fit(RTD,temp_cal','poly1');

S_type1 = 1/((type_1_AVG(7)-type_1_AVG(1))/(86-26));
S_type2 = 1/((type_2_AVG(7)-type_2_AVG(1))/(86-26));
S_type4 = 1/((type_4_AVG(7)-type_4_AVG(1))/(86-26));
S_type5 = 1/((type_5_AVG(7)-type_5_AVG(1))/(86-26));
S_type6 = 1/((type_6_AVG(7)-type_6_AVG(1))/(86-26));
S_type7 = 1/((type_7_AVG(7)-type_7_AVG(1))/(86-26));
S_type8 = 1/((type_8_AVG(7)-type_8_AVG(1))/(86-26));
S_RTD = 1/((RTD(7)-RTD(1))/(86-26));

figure(1);
hold on;
grid on;
title('Temprature to Voltage- type T(1)');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_1_AVG,temp_cal,'.');
R_sqr_fit_type1=(corr2(type_1_AVG,temp_cal')^2);
errorbar(type_1_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg,volt_err_pos,volt_err_neg,'o');
plot(fit_type1);
legend('Measured results','linear fit');
hold off;

figure(2);
hold on;
grid on;
title('Temprature to Voltage- type T(2)');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_2_AVG,temp_cal,'.');
R_sqr_fit_type2=(corr2(type_2_AVG,temp_cal')^2);
errorbar(type_2_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg,volt_err_pos,volt_err_neg,'o');
plot(fit_type2);
legend('Measured results','linear fit');
hold off;

figure(3);
hold on;
grid on;
title('Temprature to Voltage- type T(4)');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_4_AVG,temp_cal,'.');
R_sqr_fit_type4=(corr2(type_4_AVG,temp_cal')^2);
errorbar(type_4_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg,volt_err_pos,volt_err_neg,'o');
plot(fit_type4);
legend('Measured results','linear fit');
hold off;

figure(4);
hold on;
grid on;
title('Temprature to Voltage- type T(5)');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_5_AVG,temp_cal,'.');
R_sqr_fit_type5=(corr2(type_5_AVG,temp_cal')^2);
errorbar(type_5_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg,volt_err_pos,volt_err_neg,'o');
plot(fit_type5);
legend('Measured results','linear fit');
hold off;

figure(5);
hold on;
grid on;
title('Temprature to Voltage- type T(6)');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_6_AVG,temp_cal,'.');
R_sqr_fit_type6=(corr2(type_6_AVG,temp_cal')^2);
errorbar(type_6_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg,volt_err_pos,volt_err_neg,'o');
plot(fit_type6);
legend('Measured results','linear fit');
hold off;

figure(6);
hold on;
grid on;
title('Temprature to Voltage- type T(7)');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_7_AVG,temp_cal,'.');
R_sqr_fit_type7=(corr2(type_7_AVG,temp_cal')^2);
errorbar(type_7_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg,volt_err_pos,volt_err_neg,'o');
plot(fit_type7);
legend('Measured results','linear fit');
hold off;

figure(7);
hold on;
grid on;
title('Temprature to Voltage- type T(8)');
xlabel('V [V]');
ylabel('T [C]');
scatter(type_8_AVG,temp_cal,'.');
R_sqr_fit_type8=(corr2(type_8_AVG,temp_cal')^2);
errorbar(type_8_AVG,temp_cal,temp_cal_err_pos,temp_cal_err_neg,volt_err_pos,volt_err_neg,'o');
plot(fit_type8);
legend('Measured results','linear fit');
hold off;

figure(8);
hold on;
grid on;
title('Temprature to RTD resistance');
xlabel('R');
ylabel('T [C]');
scatter(RTD,temp_cal,'.');
R_sqr_fit_RTD=(corr2(RTD,temp_cal')^2);
errorbar(RTD,temp_cal,temp_cal_err_pos,temp_cal_err_neg,RTD_err_pos,RTD_err_neg,'o');
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

fitted_ethanol_temp1 = (2.195*10^4).*ethanol_type_1_AVG +27.24;
fitted_ethanol_temp2 = (2.131*10^4).*ethanol_type_2_AVG + 6.112;
fitted_ethanol_temp4 = (1.681*10^4).*ethanol_type_4_AVG + 6.105;
fitted_ethanol_temp5 = (2.084*10^4).*ethanol_type_5_AVG + 7.195;
fitted_ethanol_temp6 = (2.125*10^4).*ethanol_type_6_AVG + 6.175;
fitted_ethanol_temp7 = (2.123*10^4).*ethanol_type_7_AVG + 5.765;
fitted_ethanol_temp8 = (2.184*10^4).*ethanol_type_8_AVG + 7.062;
fitted_ethanol_tempRTD = (4.211).*ethanol_RTD_AVG -433.4;

fitted_vs_real_temp_type1 = fit(temp_ethanol',fitted_ethanol_temp1,'poly1');
fitted_vs_real_temp_type2 = fit(temp_ethanol',fitted_ethanol_temp2,'poly1');
fitted_vs_real_temp_type4 = fit(temp_ethanol',fitted_ethanol_temp4,'poly1');
fitted_vs_real_temp_type5 = fit(temp_ethanol',fitted_ethanol_temp5,'poly1');
fitted_vs_real_temp_type6 = fit(temp_ethanol',fitted_ethanol_temp6,'poly1');
fitted_vs_real_temp_type7 = fit(temp_ethanol',fitted_ethanol_temp7,'poly1');
fitted_vs_real_temp_type8 = fit(temp_ethanol',fitted_ethanol_temp8,'poly1');
fitted_vs_real_temp_RTD = fit(temp_ethanol',fitted_ethanol_tempRTD,'poly1');

figure(9);
hold on;
grid on;
title('Measured to Real Temprature type T(1)');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp1','.');
R_sqr_fitted_vs_real_temp_type1=(corr2(temp_ethanol,fitted_ethanol_temp1')^2);
plot(fitted_vs_real_temp_type1);
legend('Calculated results','Linear fit');
hold off;

figure(10);
hold on;
grid on;
title('Measured to Real Temprature type T(2)');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp2','.');
R_sqr_fitted_vs_real_temp_type2=(corr2(temp_ethanol,fitted_ethanol_temp2')^2);
plot(fitted_vs_real_temp_type2);
legend('Calculated results','Linear fit');
hold off;

figure(11);
hold on;
grid on;
title('Measured to Real Temprature type T(4)');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp4','.');
R_sqr_fitted_vs_real_temp_type4=(corr2(temp_ethanol,fitted_ethanol_temp4')^2);
plot(fitted_vs_real_temp_type4);
legend('Calculated results','Linear fit');
hold off;

figure(12);
hold on;
grid on;
title('Measured to Real Temprature type T(5)');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp5','.');
R_sqr_fitted_vs_real_temp_type5=(corr2(temp_ethanol,fitted_ethanol_temp5')^2);
plot(fitted_vs_real_temp_type5);
legend('Calculated results','Linear fit');
hold off;

figure(13);
hold on;
grid on;
title('Measured to Real Temprature type T(6)');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp6','.');
R_sqr_fitted_vs_real_temp_type6=(corr2(temp_ethanol,fitted_ethanol_temp6')^2);
plot(fitted_vs_real_temp_type6);
legend('Calculated results','Linear fit');
hold off;

figure(14);
hold on;
grid on;
title('Measured to Real Temprature type T(7)');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp7','.');
R_sqr_fitted_vs_real_temp_type7=(corr2(temp_ethanol,fitted_ethanol_temp7')^2);
plot(fitted_vs_real_temp_type7);
legend('Calculated results','Linear fit');
hold off;

figure(15);
hold on;
grid on;
title('Measured to Real Temprature type T(8)');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_temp8','.');
R_sqr_fitted_vs_real_temp_type8=(corr2(temp_ethanol,fitted_ethanol_temp8')^2);
plot(fitted_vs_real_temp_type8);
legend('Calculated results','Linear fit');
hold off;

figure(16);
hold on;
grid on;
title('Measured to Real Temprature RTD');
xlabel('Real Temprature [C]');
ylabel('Measured Temprature [C]');
scatter(temp_ethanol,fitted_ethanol_tempRTD','.');
R_sqr_fitted_vs_real_temp_RTD=(corr2(temp_ethanol,fitted_ethanol_tempRTD')^2);
plot(fitted_vs_real_temp_RTD);
legend('Calculated results','Linear fit');
hold off;

%מדידות דינמיות
% dynamic_m_type5_AVG = [mean(MEDIDOTDINAMIOT1{:,{'5'}});mean(MEDIDOTDINAMIOT2{:,{'5'}});mean(MEDIDOTDINAMIOT3{:,{'5'}})];
% dynamic_m_type6_AVG = [mean(MEDIDOTDINAMIOT1{:,{'6'}});mean(MEDIDOTDINAMIOT2{:,{'6'}});mean(MEDIDOTDINAMIOT3{:,{'6'}})];
% dynamic_m_type7_AVG = [mean(MEDIDOTDINAMIOT1{:,{'7'}});mean(MEDIDOTDINAMIOT2{:,{'7'}});mean(MEDIDOTDINAMIOT3{:,{'7'}})];
time = [0.01:0.01:30];

temp_dynamic1_m5 = (2.084*10^4).*MEDIDOTDINAMIOT3{:,{'5'}}+7.195;
temp_dynamic1_m6 = (2.125*10^4).*MEDIDOTDINAMIOT3{:,{'5'}}+6.175;
temp_dynamic1_m7 = (2.123*10^4).*MEDIDOTDINAMIOT3{:,{'5'}}+5.765;

figure(17)
hold on;
grid on;
title('Tempratures measured by Type T(5),T(6),T(7) to Time');
xlabel('Time [s]');
ylabel('Measured Temprature [C]');
% xlim([0,15]);
plot(time,temp_dynamic1_m5');
plot(time,temp_dynamic1_m6');
plot(time,temp_dynamic1_m7');
legend('small node','medium node','large node');
hold off;

temp_dynamic_m1 = (2.195*10^4).*MEDIDOTDINAMIOT3{:,{'1'}} +27.24;
temp_dynamic_m2 = (2.131*10^4).*MEDIDOTDINAMIOT3{:,{'2'}} + 6.112;
temp_dynamic_m4 = (1.681*10^4).*MEDIDOTDINAMIOT3{:,{'4'}} + 6.105;
temp_dynamic_m8 =(2.184*10^4).*MEDIDOTDINAMIOT3{:,{'8'}} + 7.062;
temp_dynamic_mRTD = (4.211).*MEDIDOTDINAMIOT3{:,{'9'}} -433.4;

figure(18)
hold on;
grid on;
title('Tempratures measured by RTD to Time');
xlabel('Time [s]');
ylabel('Measured Temprature [C]');
plot(time,temp_dynamic_mRTD');
hold off;

% T0_TYPE1 = temp_dynamic_m1(1);
% T0_TYPE2 = temp_dynamic_m2(1);
% T0_TYPE4 = temp_dynamic_m4(1);
T0_TYPE5 = temp_dynamic1_m5(1);
T0_TYPE6 = temp_dynamic1_m6(1);
T0_TYPE7 = temp_dynamic1_m7(1);
% T0_TYPE8 = temp_dynamic_m8(1);
T0_RTD = temp_dynamic_mRTD(1);

T_inf_5 = 71; %C
T_inf_6 = 71; %C
T_inf_7 = 71; %C
T_inf_RTD = 66; %C

dynamic_mes_lnfunc5 = log((temp_dynamic1_m5-T_inf_5)/(T0_TYPE5-T_inf_5));
dynamic_mes_lnfunc6 = log((temp_dynamic1_m6-T_inf_6)/(T0_TYPE6-T_inf_6));
dynamic_mes_lnfunc7 = log((temp_dynamic1_m7-T_inf_7)/(T0_TYPE7-T_inf_7));
dynamic_mes_lnfuncRTD = log((temp_dynamic_mRTD-T_inf_RTD)/(T0_RTD-T_inf_RTD));

figure(19);
hold on;
grid on;
title('הקשר המתואר במשוואה *** עבור הצמד התרמי עם הצומת הקטנה');
xlabel('Time [s]');
ylabel('ln((T0-Tinf)/(T0-Tinf))');
plot(time,dynamic_mes_lnfunc5');
hold off;

figure(20);
hold on;
grid on;
title('הקשר המתואר במשוואה *** עבור הצמד התרמי עם הצומת הבינונית')
xlabel('Time [s]');
ylabel('ln((T0-Tinf)/(T0-Tinf))');
plot(time,dynamic_mes_lnfunc6');
hold off;

figure(21);
hold on;
grid on;
title('הקשר המתואר במשוואה *** עבור הצמד התרמי עם הצומת הגדולה');
xlabel('Time [s]');
ylabel('ln((T0-Tinf)/(T0-Tinf))');
plot(time,dynamic_mes_lnfunc7');
hold off;

figure(22);
hold on;
grid on;
title('RTD');
xlabel('Time [s]');
ylabel('ln((T0-Tinf)/(T0-Tinf))');
plot(time,-abs(dynamic_mes_lnfuncRTD'));
hold off;

time_coeff5 = -time./dynamic_mes_lnfunc5';
AVG_time_coeff5 = mean(time_coeff5(2:1:3000));
time_coeff6 = -time./dynamic_mes_lnfunc6';
AVG_time_coeff6 = mean(time_coeff6(2:1:3000));
time_coeff7 = -time./dynamic_mes_lnfunc7';
AVG_time_coeff7 = mean(time_coeff7(2:1:3000));
time_coeffRTD = -time./-abs(dynamic_mes_lnfuncRTD');
AVG_time_coeffRTD = mean(time_coeffRTD(2:1:3000)); %לפי האקסל זה 69.77 יש פה בעיה בחישוב לא יודעת מה

