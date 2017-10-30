classdef LaserStarInc < matlab.apps.AppBase
    
    properties (Access = public)
        UIFigure matlab.ui.Figure
        laserStopButton matlab.ui.control.Button
        historyButton matlab.ui.control.Button
        measureButton matlab.ui.control.Button
        buttonSettings matlab.ui.control.Button
        panel1 matlab.ui.container.Panel
        panel2 matlab.ui.container.Panel
        panel3 matlab.ui.container.Panel
        panel4 matlab.ui.container.Panel
        panel5 matlab.ui.container.Panel
        panel6 matlab.ui.container.Panel
        panel7 matlab.ui.container.Panel
        AmplitudeSlider1  matlab.ui.control.Slider
        AmplitudeSlider2  matlab.ui.control.Slider
        AmplitudeSlider3  matlab.ui.control.Slider
        SliderLabel1  matlab.ui.control.Label
        SliderLabel2  matlab.ui.control.Label
        SliderLabel3  matlab.ui.control.Label
        buttonStartSettings matlab.ui.control.Button
        UIAxes matlab.ui.control.UIAxes
        UIAxes1 matlab.ui.control.UIAxes
        UIAxes2 matlab.ui.control.UIAxes
        UIAxes3 matlab.ui.control.UIAxes
        measureButtonPush
        patientButton matlab.ui.control.Button
        roiButton matlab.ui.control.Button
        startRecordingButton matlab.ui.control.Button
        %patientIDField matlab.ui.control.NumbericEditField
        patientIDLabel matlab.ui.control.Label
        registerPatientlabel matlab.ui.control.Label
        
    end

    methods (Access = public)
        
        function createComponents(app)

            
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 1000 1280 720];
            app.UIFigure.Name = 'LaserStarInc.';
%% panels              
            % Main Panel, storing all additional information
            app.panel1 = uipanel(app.UIFigure);
            app.panel1.Title = '';
            app.panel1.Position = [190 40 1020 640];
            app.panel1.Visible = 'off';
            app.panel1.BackgroundColor = [1 1 1]
            
            % Panels around settings
            app.panel2 = uipanel(app.UIFigure);
            app.panel2.Position = [49 505 142 142]
            app.panel2.Visible = 'on';
            app.panel2.BorderType = 'none';
            
            % Auxiliary panel for panel 2
            app.panel3 = uipanel(app.UIFigure);
            app.panel3.Position = [185 506 10 140]
            app.panel3.Visible = 'off'
            app.panel3.BorderType = 'none';
            app.panel3.BackgroundColor = [1 1 1]
            
            % Panel around measure
            app.panel4 = uipanel(app.UIFigure);
            app.panel4.Position = [49 361 142 142]
            app.panel4.Visible = 'on'
            app.panel4.BorderType = 'none';
            
            % Auxiliary panel for panel 4
            app.panel5 = uipanel(app.UIFigure);
            app.panel5.Position = [185 362 10 140]
            app.panel5.Visible = 'off'
            app.panel5.BorderType = 'none';
            app.panel5.BackgroundColor = [1 1 1]
            
            % Panel around history
            app.panel6 = uipanel(app.UIFigure);
            app.panel6.Position = [49 217 142 142]
            app.panel6.Visible = 'on'
            app.panel6.BorderType = 'none';
            
            % Auxiliary panel for panel 6
            app.panel7 = uipanel(app.UIFigure);
            app.panel7.Position = [185 218 10 140]
            app.panel7.Visible = 'off'
            app.panel7.BorderType = 'none';
            app.panel7.BackgroundColor = [1 1 1]
           
            
  %% Section Buttons
            % Create Button
            app.laserStopButton = uibutton(app.UIFigure, 'push')
            app.laserStopButton.Position = [65 89 110 110]
            app.laserStopButton.Text = 'Stop Laser';
            app.laserStopButton.Icon = 'if_controls_stop_103461.png'
            app.laserStopButton.BackgroundColor = [1 0 0]
            
            % Button history 
            app.historyButton = uibutton(app.panel6, 'push')
            app.historyButton.Position = [16 16 110 110]
            app.historyButton.Text = 'History';
            app.historyButton.Icon = 'if_history_326655.png'
            app.historyButton.ButtonPushedFcn = createCallbackFcn(app, @historyButtonPushed, true);
            
            % Button measure 
            app.measureButton = uibutton(app.panel4, 'push')
            app.measureButton.Position = [16 16 110 110]
            app.measureButton.Text = 'Measure';
            app.measureButton.Icon = 'if_stethoscope_1608853.png';
            app.measureButton.ButtonPushedFcn = createCallbackFcn(app, @measureButtonPushed, true);
            
            % Button settings 
            app.buttonSettings = uibutton(app.panel2, 'push')
            app.buttonSettings.Position = [16 16 110 110]
            app.buttonSettings.Text = 'Settings';
            app.buttonSettings.Visible = 'on';
            app.buttonSettings.Icon = 'settings-5-xxl.png';
            app.buttonSettings.ButtonPushedFcn = createCallbackFcn(app, @buttonSettingsPushed, true);
            
            
          
        end
    end
    methods (Access = public)
        
        function app = LaserStarInc
            
            createComponents(app)
            
            registerApp(app, app.UIFigure)
            if nargout ==0 
                clear app
            end
        end
    
    end
end

