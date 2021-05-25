package hk.polyu.repackage;

import java.util.List;

import hk.polyu.Configuration;
import soot.PackManager;
import soot.Scene;
import soot.options.Options;

public class SootEnvironment {
	
	public static SootEnvironment env;
	
	public void initSoot(List<String> processList, String outputJarDir) {
		soot.G.reset();
		
		Options.v().set_no_bodies_for_excluded(true);
		Options.v().set_allow_phantom_refs(true);
		Options.v().set_whole_program(true);
		Options.v().set_src_prec(Options.src_prec_apk_class_jimple);
		Options.v().set_output_format(Options.output_format_class);
		Options.v().set_force_overwrite(true);
		Options.v().set_process_dir(processList);
		Options.v().set_soot_classpath(Configuration.RTJar);
		Options.v().set_output_dir(outputJarDir);
		Options.v().set_keep_line_number(true);
		Options.v().set_keep_offset(true);
		Options.v().set_ignore_resolving_levels(true);
		
		Scene.v().loadNecessaryClasses();
	}
	
	public void outputJar() {
		PackManager.v().runPacks();
		PackManager.v().writeOutput();
	}

}
