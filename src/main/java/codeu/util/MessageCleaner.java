package codeu.util;

import java.util.List;
import java.util.ArrayList;
import java.util.regex.*;
import org.jsoup.Jsoup;
import codeu.model.data.Message;
import org.jsoup.nodes.Document.OutputSettings;
import org.jsoup.safety.Whitelist;
import com.google.cloud.translate.Detection;
import com.google.cloud.translate.Language;
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.LanguageListOption;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;

public class MessageCleaner {

	public static String clean(String messageContent){
		//adjusted settings for cleaning done by Jsoup
		OutputSettings settings = new OutputSettings();
		settings.prettyPrint(false);

		// this removes all HTML tags except for text nodes (a, b, blockquote, li, ol)
    // reference for this whitelist can be found here: https://jsoup.org/apidocs/org/jsoup/safety/Whitelist.html#basic--
    Whitelist list = Whitelist.basic();

    // Divs will serve as the way of adding color styling for the text.
    // A colored section will be indicated by a div with the class tag of the appropriate color.
    list.addTags("div");
    list.addAttributes("div", "class");

    String cleanedMessageContent = Jsoup.clean(messageContent, "", list, settings);
    
    // this updates urls to be hyperlink references
    cleanedMessageContent = replaceUrls(cleanedMessageContent);

    return cleanedMessageContent;

	}

  public static String replaceUrls(String text){
	  String newText = text;
	  ArrayList<String> containedUrls = new ArrayList<String>();
		// regular expression taken from https://stackoverflow.com/questions/5713558/detect-and-extract-url-from-a-string
		// matches with ftp, http, https, and www prefixed urls
		Pattern pattern = Pattern.compile(
		   "(?:^|[\\W])((ht|f)tp(s?):\\/\\/|www\\.)"
		            + "(([\\w\\-]+\\.){1,}?([\\w\\-.~]+\\/?)*"
		            + "[\\p{Alnum}.,%_=?&#\\-+()\\[\\]\\*$~@!:/{};']*)",
		            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
		Matcher urlMatcher = pattern.matcher(text);

		while (urlMatcher.find())
		{
		    containedUrls.add(text.substring(urlMatcher.start(0),
		            urlMatcher.end(0)));
		}

		// iterate backwards over containedUrls to update the text with <a></a> tags
		for (int i = containedUrls.size()-1; i >=0; i--){
		  int index = text.lastIndexOf(containedUrls.get(i));
		  //remove this instance of the url from the original text:
		  text = text.substring(0,index) + text.substring(index + containedUrls.get(i).length());
		  //update the instance of the url in the new text:
		  newText = newText.substring(0,index) + "<a href='" + containedUrls.get(i) + "'>" 
		          + containedUrls.get(i) + "</a>" + newText.substring(index + containedUrls.get(i).length());
		}
		return newText;
  }


}