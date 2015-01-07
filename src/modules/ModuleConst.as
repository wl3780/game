package modules
{
	import flash.utils.getQualifiedClassName;
	
	import modules.scene.SceneModule;

	public class ModuleConst
	{
		public static const SCENE_MODULE:String = getQualifiedClassName(SceneModule);
	}
}