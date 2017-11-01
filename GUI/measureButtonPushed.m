        function measureButtonPushed(app, event)
            % Toggles the panels according to the mockup
            app.panel1.Visible = 'on';
            app.panel4.BackgroundColor = [1 1 1];
            app.panel4.BorderType = 'line';
            app.panel5.Visible = 'on';
            % untoggle the residual panels
            app.panel2.BorderType = 'none';
            app.panel6.BorderType = 'none';
            app.panel2.BackgroundColor = [0.94 0.94 0.94];
            app.panel6.BackgroundColor = [0.94 0.94 0.94];
            app.panel3.Visible = 'off'
            app.panel7.Visible = 'off'
            %% Here, just the function of this section is coded
            % Residual functions have to be toggled invisible before or
            % another approach has to be found TBC
            % patientButton
            app.patientButton = uibutton(app.panel1, 'push');
            app.patientButton.Text = 'Patient';
            app.patientButton.Position = [35 481 110 110];
            
            % roiButton
            app.roiButton = uibutton(app.panel1, 'push');
            app.roiButton.Text = 'ROI';
            app.roiButton.Position = [170 481 110 110];
            
            %% startRecordingButton 
            app.startRecordingButton = uibutton(app.panel1, 'push');
            app.startRecordingButton.Text = 'Start Recording';
            app.startRecordingButton.Position = [305 481 110 110];
            
            % patientButton (default) %patientButton as a standalone function
            app.patientIDLabel = uilabel(app.panel1);
            app.patientIDLabel.Position = [35 417 380 30];
            app.patientIDLabel.Text = 'Enter PatientID';
            app.patientIDLabel.FontSize = 24;
            
            % editField to insert the patientID
            %app.patientIDField = uieditfield(app.panel1, 'numeric');
            %app.patientIDField.Position = [35 307 380 30];
            
            %app.registerPatientLabel = uilabel(app.panel1);
            %app.registerPatientlabel.Position = [35 273 380 30];
            %app.registerPatientlabel.Text = 'Register new Patient';
            %app.registerPatientlabel.FontSize = 24;
            
           
        end