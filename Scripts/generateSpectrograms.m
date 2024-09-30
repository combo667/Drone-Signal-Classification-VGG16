clc;
clear;
close all;

fs=30.72e6;

fp=fopen('E:\Drone_Signal_Classification\WITH_NOISE\Elsec_Dataset_fs_30.72_MHz\Signals\elsec_drone\elsec_drone\DRONE\2450_nc0_p40.txt','r');
save_output_path = 'E:\Drone_Signal_Classification\WITH_NOISE\Elsec_Dataset_fs_30.72_MHz\dataset\elsec\';


spec_cnt = 640;


for batch=0:499

    hold on;



    data_I_sgn = zeros(999999,1);
    data_Q_sgn = zeros(999999,1);

    index =0;
    count=(batch*1000000);
    endsample=(batch*1000000)+999999;
    while(count<endsample)
        line=fgetl(fp);
        count=count+1;
        data=str2double(line);
        I_Q=data;
        data_bin=dec2bin(I_Q,32);
        data_I=bin2dec(data_bin(17:32));
        data_Q=bin2dec(data_bin(1:16));
        index = index + 1;
        data_I_sgn(index)=double(typecast(uint16(data_I),'int16'));
        data_Q_sgn(index)=double(typecast(uint16(data_Q),'int16'));

    end
    data_=data_I_sgn+(1i)*data_Q_sgn;
    % fscale=-fs/2:fs/endsample:fs/2-(fs/endsample);


    % figure;
    % plot(real(data_));
    % hold on;
    % plot(imag(data_));
    % xlabel('No of samples');
    % ylabel('Amplitude');
    % title('I Q data plot');
    %
    % figure;
    % plot(fscale,20*log10(fftshift(abs(fft(data_)))));
    % xlabel('Frequency');
    % ylabel('Power');
    % title('FFT of I Q data plot');

    wind = window(@blackmanharris,length(data_));


    noisySignal = awgn(data_,15,"measured");

    % [Sxxx_I,fx_I,tx_I] = spectrogram(noisySignal, hann(1024),512,1024,fs,'centered');
    % imagesc(tx_I,fx_I,10*log10(abs(Sxxx_I)));


    figure;
    spectrogram(noisySignal,128,[],[],fs,'centered');
    title('');
    axis tight;
    colorbar("off");
    set(gca,'XTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XColor','none');
    set(gca,'YColor','none');
    fig_width_inch = 224 / 100; % Convert pixels to inches (assuming 100 dpi)
    fig_height_inch = 224 / 100; % Convert pixels to inches (assuming 100 dpi)
    set(gcf, 'Units', 'inches');
    set(gcf, 'Position', [1, 1, fig_width_inch, fig_height_inch]); % Set figure size in inches

    print(gcf, fullfile(save_output_path,sprintf('Spectrogram_%d.png',spec_cnt)), '-dpng', sprintf('-r%d', 100)); % Set resolution (100 dpi)
    spec_cnt = spec_cnt +1;

    close(gcf);

end
hold off;

fclose(fp);