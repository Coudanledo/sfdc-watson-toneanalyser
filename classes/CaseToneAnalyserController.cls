public with sharing class CaseToneAnalyserController {
    
    public CaseToneAnalyserController(ApexPages.StandardController ctrl) {}
    
    @RemoteAction
    public static ToneAnalyserService.ToneAnalysis callAnalyserService(String caseId) {
    	Case currentCase = [Select Description From Case where Id = :caseId];
        return ToneAnalyserService.callWatsonToneAnalyser(currentCase.Description);
    }
}