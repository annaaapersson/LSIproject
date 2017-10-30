function buttonSettingsPushed(app, event)
    %toggle the auxilary and the panel around the button
            app.panel1.Visible = 'on';
            app.panel2.BorderType = 'line';
            app.panel2.BackgroundColor = [1 1 1];
            app.panel3.Visible = 'on';
    % untoggle the residual panels
            app.panel6.BorderType = 'none';
            app.panel4.BorderType = 'none';
            app.panel6.BackgroundColor = [0.94 0.94 0.94];
            app.panel4.BackgroundColor = [0.94 0.94 0.94];
            app.panel7.Visible = 'off'
            app.panel5.Visible = 'off'
    %% Elements in panel 1
            app.buttonStartSettings = uibutton(app.panel1, 'push')
            app.buttonStartSettings.Position = [35 54 380 100]
            app.buttonStartSettings.Text = 'Start System with set Parameters';
            % Axis // Move to "main" and toggle visibility
            app.UIAxes = uiaxes(app.panel1);
            app.UIAxes.Position = [445 35 540 570]
            app.UIAxes.Box = 'off';
            app.UIAxes.XGrid = 'off';
            app.UIAxes.YGrid = 'off';
     
            imshow('Bildschirmfoto 2017-10-02 um 15.19.14.png','Parent',app.UIAxes);
            
            % Sliders
            %app.SliderLabel1 = uilabel(app.panel1);
            %app.SliderLabel1.HorizontalAlignment = 'right';
            %app.SliderLabel1.Position = [49 248 60 15];
            %app.SliderLabel1.Text = 'Kernel Size';
            app.UIAxes1 = uiaxes(app.panel1);
            app.UIAxes1.Position = [49 216 64 64]
            title(app.UIAxes1, []);
            xlabel(app.UIAxes1, []);
            ylabel(app.UIAxes1, []);
            app.UIAxes1.XAxis.TickLabels = {};
            app.UIAxes1.YAxis.TickLabels = {};
            I = imshow('if_th_1608949.png', 'Parent', app.UIAxes1, ...
                        'XData', [1 app.UIAxes.Position(3)], ...
                        'YData', [1 app.UIAxes.Position(4)]);
            app.UIAxes1.XLim = [0 I.XData(2)];
            app.UIAxes1.YLim = [0 I.YData(2)];
            %imshow('/Users/oliverstangl/Documents/MATLAB/if_th_1608949.png','Parent',app.UIAxes1);
            
            % Slider Kernel Size bla bla
            app.AmplitudeSlider1 = uislider(app.panel1);
            %app.AmplitudeSlider1.ValueChangedFcn = createCallbackFcn(app, @AmplitudeSliderValueChanged, true);
            app.AmplitudeSlider1.Position = [145 248 240 3];
            % Gain Image
            app.UIAxes2 = uiaxes(app.panel1);
            app.UIAxes2.Position = [49 360 64 64]
            app.UIAxes2.Box = 'off';
            app.UIAxes2.XGrid = 'off';
            app.UIAxes2.YGrid = 'off';
            imshow('if_spinner_1608847.png','Parent',app.UIAxes2);
            % Slider Gain
            app.AmplitudeSlider2 = uislider(app.panel1);
            %app.AmplitudeSlider2.ValueChangedFcn = createCallbackFcn(app, @AmplitudeSliderValueChanged, true);
            app.AmplitudeSlider2.Position = [145 392 240 3];
            % Image aperture
            app.UIAxes3 = uiaxes(app.panel1);
            app.UIAxes3.Position = [49 504 64 64]
            app.UIAxes3.Box = 'off';
            app.UIAxes3.XGrid = 'off';
            app.UIAxes3.YGrid = 'off';
            imshow('if_adjust-contrast_216432-2.png','Parent',app.UIAxes3);
            % Slider aperture
            app.AmplitudeSlider3 = uislider(app.panel1);
            %app.AmplitudeSlider3.ValueChangedFcn = createCallbackFcn(app, @AmplitudeSliderValueChanged, true);
            app.AmplitudeSlider3.Position = [145 536 240 3];
            
        end