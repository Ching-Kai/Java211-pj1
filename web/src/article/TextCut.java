package article;

public class TextCut {
	//擷取部分內容，如果文字長度小於擷取長度就顯示全部
	public String txtBack(String txt, int leng) {
		int txt_count = txt.length();
		if(txt_count>leng)
			txt = txt.substring(0, leng)+ " ...";
		else
			txt = txt.substring(0, txt_count);
		return txt;
	}
}
