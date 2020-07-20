public class PostInstallCallback implements MetaData.DeployCallback {
    public void handleResult(Metadata.DeployResult result, Metadata.DeployCallbackContext context) {
        if (result.status == Metadata.DeployStatus.Succeeded) {
            System.debug('Deployment succeded.');
        } else {
         System.debug('Deployment failed.');   
        }           
    }
}