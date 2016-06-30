public class ToneAnalyserService {

    public static ToneAnalysis callWatsonToneAnalyser(String content) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Bluemix_Tone_Analyser/v3/tone?version=2016-05-18');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(stringToJSON(content));
        Http http = new Http();
        HTTPResponse res = http.send(req);
        return (ToneAnalysis) JSON.deserialize(res.getBody(), ToneAnalysis.class);
    }
    
    private static String stringToJSON(String content) {
        JSONGenerator generator = JSON.createGenerator(true);
        generator.writeStartObject();
        generator.writeStringField('text', content);
        generator.writeEndObject();
		return generator.getAsString();
	}
    
    public Class ToneAnalysis {
        DocumentTone document_tone {get; set;} 
    }
    
    public Class DocumentTone {
        List<ToneCategory> tone_categories {get; set;}
    }
    
    public Class ToneCategory {
		List<Tone> tones {get; set;}
        String category_id {get; set;}
        String category_name {get; set;}
    }
    
    public Class Tone {
        Double  score {get; set;}
        String tone_id {get; set;}
        String tone_name {get; set;}
    }
}