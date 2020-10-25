
public aspect TraceAspect_Li 
{
	 pointcut classToTrace(): within(*App);
	 //your answer:
	 
	 /* Tracing a method of the class.
	  * //execution: Pick out joint points defining method execution (callee)
	 */
	 pointcut methodToTrace(): classToTrace() && execution(String getName());
	  
	 /* Tracing before and after executing a method.
	  *prints something like: "[EGN]String ComponentApp.getName(), 9
				[END]ComponentApp.java"
	 */
	 before(): methodToTrace() {
		 String info = thisJoinPointStaticPart.getSignature() + ", " //prints method signature 
		 		 + thisJoinPointStaticPart.getSourceLocation().getLine();//prints method line number
		 System.out.println("[BGN]" + info);
	 }
	 
	 
	 after(): methodToTrace() {
		 System.out.println("[END]" + thisJoinPointStaticPart.getSourceLocation().getFileName());
	 }
}
