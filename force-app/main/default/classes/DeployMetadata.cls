public class DeployMetadata {
    public MetaData.DeployContainer constructDeploymentRequest() {
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        Metadata.Layout layoutMetadata = new UpdatePageLayout().buildLayout();
        container.addMetadata(layoutMetadata);
        return container;
    }
    
    public void deploy(Metadata.DeployContainer container) {
        PostInstallCallback callback = new PostInstallCallback();
        Id isAsync = Metadata.Operations.enqueueDeployment(container, callback);
    }
}