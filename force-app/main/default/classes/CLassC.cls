public class CLassC {
	public static void method3()
    {
        classA classAobj =  new classA();
        ClassB classCobj = new ClassB();
        integer dataC = classAobj.method1();
        integer dataD = classCobj.method2();
        integer total = dataC +dataD;
        system.debug(total);
        
    }
}