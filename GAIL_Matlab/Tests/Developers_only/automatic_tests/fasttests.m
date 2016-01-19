% Drives all doctests and unit tests
format short

GAILPATH = GAILstart(0);
completereport = strcat(GAILPATH,'OutputFiles',filesep,...
  'gail_tests-', datestr(now,'yyyy-mm-dd-HH-MM-SS'),'.txt');
diary(completereport)

shortutestreport = strcat(GAILPATH,'OutputFiles',filesep,...
   'gail_unittests','.txt');
fid = fopen(shortutestreport,'wt');

tic; 

%% CALL DOCTESTS 
doctest funappx_g; time=toc
doctest dt_funappx_g; time=toc
doctest funmin_g; time=toc
doctest integral_g; time=toc
doctest integralsim_g; time=toc
doctest dt_integral_g ; time=toc
doctest meanMC_g; time=toc
doctest meanMCBer_g; time=toc
doctest cubLattice_g; time=toc
doctest cubSobol_g; time=toc
doctest dt_integralNoPenalty_g; time=toc

%% CALL UNIT TESTS
[~,~,MATLABVERSION]=GAILstart(0);
if MATLABVERSION < 8.1
    warning('Cannot run unit tests in MATLAB version before 8.1');
else
    warning('off','GAIL:integral_g:peaky')
    warning('off','GAIL:integral_g:exceedbudget')
    try
        Tests = matlab.unittest.TestSuite.fromClass(?ut_integral_g);
        results=run(ut_integral_g)
        if sum([results.Failed])>0
            failed=find([results.Failed]>0);
            for i=1:size(failed,2)
                fprintf(fid,'%s\n',Tests(failed(i)).Name);
            end
        end
    catch
        display('Test ut_integral_g is wrongly coded. We skip it.')
        fprintf(fid,'Test ut_integral_g is wrongly coded. We skip it.\n');
    end
    warning('on','GAIL:integral_g:peaky')
    warning('on','GAIL:integral_g:exceedbudget')
    
	warning('off','GAIL:integralsim_g:peaky')
	warning('off','GAIL:integralsim_g:exceedbudget')
	try
	    Tests = matlab.unittest.TestSuite.fromClass(?ut_integralsim_g);
	    results=run(ut_integralsim_g)
	    if sum([results.Failed])>0
		failed=find([results.Failed]>0);
		for i=1:size(failed,2)
		    fprintf(fid,'%s\n',Tests(failed(i)).Name);
		end
	    end
	catch
	    display('Error: Test ut_integralsim_g is wrongly coded. We skip it.')
	    fprintf(fid,'Error: Test ut_integralsim_g is wrongly coded. We skip it.\n');
	end
	warning('on','GAIL:integralsim_g:peaky')
	warning('on','GAIL:integralsim_g:exceedbudget')
    
    try
        Tests = matlab.unittest.TestSuite.fromClass(?ut_funappx_g);
        results=run(ut_funappx_g)
        if sum([results.Failed])>0
            failed=find([results.Failed]>0);
            for i=1:size(failed,2)
                fprintf(fid,'%s\n',Tests(failed(i)).Name);
            end
        end
    catch
        display('Error: Test ut_funappx_g is wrongly coded. We skip it.')
        fprintf(fid,'Error: Test ut_funappx_g is wrongly coded. We skip it.\n');
    end
    
    
    try
        Tests = matlab.unittest.TestSuite.fromClass(?ut_funmin_g);
        results=run(ut_funmin_g)
        if sum([results.Failed])>0
            failed=find([results.Failed]>0);
            for i=1:size(failed,2)
                fprintf(fid,'%s\n',Tests(failed(i)).Name);
            end
        end
    catch
        display('Error: Test ut_funmin_g is wrongly coded. We skip it.')
        fprintf(fid,'Error: Test ut_funmin_g is wrongly coded. We skip it.\n');
    end
    
    try
        Tests = matlab.unittest.TestSuite.fromClass(?ut_funmin_g_end);
        results=run(ut_funmin_g_end)
        if sum([results.Failed])>0
            failed=find([results.Failed]>0);
            for i=1:size(failed,2)
                fprintf(fid,'%s\n',Tests(failed(i)).Name);
            end
        end
    catch
        display('Error: Test ut_funmin_g_end is wrongly coded. We skip it.')
        fprintf(fid,'Error: Test ut_funmin_g_end is wrongly coded. We skip it.\n');
    end
    
    try
        Tests = matlab.unittest.TestSuite.fromClass(?ut_meanMC_g);
        results=run(ut_meanMC_g)
        if sum([results.Failed])>0
            failed=find([results.Failed]>0);
            for i=1:size(failed,2)
              fprintf(fid,'%s\n',Tests(failed(i)).Name);
            end
        end
    catch
        display('Error: Test ut_meanMC_g is wrongly coded. We skip it.')
        fprintf(fid,'Error: Test ut_meanMC_g is wrongly coded. We skip it.\n');
    end
    
    
    try
        Tests = matlab.unittest.TestSuite.fromClass(?ut_cubLattice_g);
        results=run(ut_cubLattice_g)
        if sum([results.Failed])>0
            failed=find([results.Failed]>0);
            for i=1:size(failed,2)
                fprintf(fid,'%s\n',Tests(failed(i)).Name);
            end
        end
    catch
        display('Error: Test ut_cubLattice_g is wrongly coded. We skip it.')
        fprintf(fid,'Error: Test ut_cubLattice_g is wrongly coded. We skip it.\n');
    end
    
    try
        Tests = matlab.unittest.TestSuite.fromClass(?ut_cubSobol_g);
        results=run(ut_cubSobol_g)
        if sum([results.Failed])>0
            failed=find([results.Failed]>0);
            for i=1:size(failed,2)
                fprintf(fid,'%s\n',Tests(failed(i)).Name);
            end
        end
    catch
        display('Error: Test ut_cubSobol_g is wrongly coded. We skip it.')
        fprintf(fid,'Error: Test ut_cubSobol_g is wrongly coded. We skip it.\n');
    end
    
    
    %run_handle_ut(fid,'ut_cubMC_g')
    
    %   try
    %     Tests = matlab.unittest.TestSuite.fromClass(?ut_integralNoPenalty_g);
    %     results=run(ut_integralNoPenalty_g)
    %     if sum([results.Failed])>0
    %       failed=find([results.Failed]>0);
    %       for i=1:size(failed,2)
    %         fprintf(fid,'%s\n',Tests(failed(i)).Name);
    %       end
    %     end
    %   catch
    %     display('Error: Test ut_integralNoPenalty_g is wrongly coded. We skip it.')
    %     fprintf(fid,'Error: Test ut_integralNoPenalty_g is wrongly coded. We skip it.\n');
    %   end
    % run_handle_ut(fid,'ut_integralNoPenalty_g')
end

time=toc;
% disp(time)

diary off
fclose(fid);
